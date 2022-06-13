import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../model/order/orderProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../screens/paymentLoadingScreen.dart';
import '../../model/address/addressProvider.dart';

class CheckOut extends StatefulWidget {
  CheckOutState createState() => CheckOutState();
}

class CheckOutState extends State<CheckOut> {
  late Razorpay razorpay;
  int selectedValue = 1;
  var selectedCoupon;
  String? coupon;
  // bool isLoading = true;
  String? couponCode;
  double amount = 0;
  String? minOrder;
  String? responseOrderId;
  String? responsePaymentId;
  String? responseSignature;
  String? receipt;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    getCoupon();
    razorpay = Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  Future<void> getCoupon() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    couponCode = localStorage.getString('couponCode');
    minOrder = localStorage.getString('couponAmount');
    amount = double.parse(minOrder!);
    print('Code: $couponCode');
    print('Min Order: $amount');
  }

  void _handlePaymentSuccess(
      PaymentSuccessResponse paymentSuccessResponse) async {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + paymentSuccessResponse.paymentId!,
        toastLength: Toast.LENGTH_LONG);

    responseOrderId = paymentSuccessResponse.orderId;
    responsePaymentId = paymentSuccessResponse.paymentId;
    responseSignature = paymentSuccessResponse.signature;

    print('Payment Response Order ID ${paymentSuccessResponse.orderId}');
    print('Payment Response Payment ID ${paymentSuccessResponse.paymentId}');
    print('Payment Response Signature ${paymentSuccessResponse.signature}');

    print('Recipt : $receipt');
    print('Payment Success Order ID: $responseOrderId');
    print('Payment Success Payment ID: $responsePaymentId');
    print('Payment Success Signature: $responseSignature');

    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PaymentLoadingScreen(receipt!, responseOrderId!,
            responsePaymentId!, responseSignature!)));
  }

  Future<void> razorPayCheckout() async {
    try {
      Provider.of<OrderProvider>(context, listen: false)
          .postRazorPayOrder()
          .then((_) {
        receipt = Provider.of<OrderProvider>(context, listen: false)
            .orderId['data']['receipt'];
        var options = {
          'key': 'rzp_test_EK1Fh8he18fUGa',
          'amount': Provider.of<OrderProvider>(context, listen: false)
                  .orderId['data']['amount_due'] /
              100,
          'name': 'Tanvee Order',
          'order_id': Provider.of<OrderProvider>(context, listen: false)
              .orderId['data']['id'],
          // 'order_id': 'order_JWg1YWglJjXPak',
          // 'description': 'Fine T-Shirt',
          'prefill': {'contact': '+919831405393', 'email': 'siddc.8@gmail.com'}
        };
        print('OPTIONS $options');
        razorpay.open(options);
      });
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> codCheckOut() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final response =
        await Provider.of<OrderProvider>(context, listen: false).postCodOrder();

    if (response['status'] == 'success') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text(
          'Thank You!! Your order is successfully placed!',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            label: 'OK',
            textColor: Colors.white,
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
      localStorage.remove('couponCode');
    }
    Navigator.of(context).pushNamed('/landing-page');
  }

  void _handlePaymentError(PaymentFailureResponse paymentFailureResponse) {
    Fluttertoast.showToast(
        msg: "ERROR: " +
            paymentFailureResponse.code.toString() +
            "-" +
            paymentFailureResponse.message!,
        toastLength: Toast.LENGTH_LONG);
    print('PAYMENT ERROR ${paymentFailureResponse.code.toString()}');
    print('PAYMENT DESCRIPTION ${paymentFailureResponse.message}');
  }

  void _handleExternalWallet(ExternalWalletResponse externalWalletResponse) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + externalWalletResponse.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final routes =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final provider = Provider.of<OrderProvider>(context).orderId;
    final defaultAddress = Provider.of<AddressProvider>(context).defaultAddress;

    final data = routes['data'];
    final taxAmount = routes['tax'];
    final couponCode = routes['discountCode'];

    print('DATA: $data');

    print('Payment Success Order ID $responseOrderId');
    print('Payment Success Payment ID $responsePaymentId');
    print('Payment Success Signature $responseSignature');

    // print('Min Order Amount: ${double.parse(selectedCoupon['min_order_amt'])}');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        toolbarHeight: tabLayout ? height * 0.05 : height * 0.07,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: tabLayout
                    ? height * 0.07
                    : largeLayout
                        ? height * 0.05
                        : height * 0.08,
                width: !tabLayout && !largeLayout ? width * 0.12 : width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Icon(Icons.arrow_back_ios,
                        size: tabLayout
                            ? 40
                            : largeLayout
                                ? 14
                                : 18,
                        color: Colors.green),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: tabLayout
                      ? width * 0.33
                      : largeLayout
                          ? width * 0.25
                          : width * 0.21),
              child: Text(
                'Checkout',
                // // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout
                        ? 35
                        : largeLayout
                            ? 19
                            : 14),
              ),
            )
          ],
        ),
        // leading: InkWell(
        //   onTap: () => Navigator.of(context).pop(),
        //   child: Container(
        //     height: tabLayout ? height * 0.07 : height * 0.05,
        //     width: width * 0.1,
        //     decoration: BoxDecoration(
        //         color: Colors.white,
        //         borderRadius: BorderRadius.circular(10),
        //         boxShadow: const [
        //           BoxShadow(
        //               color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
        //         ]),
        //     child: Center(
        //       child: Padding(
        //         padding: EdgeInsets.only(left: width * 0.02),
        //         child: Icon(Icons.arrow_back_ios,
        //             size: tabLayout
        //                 ? 40
        //                 : largeLayout
        //                     ? 14
        //                     : 18,
        //             color: Colors.green),
        //       ),
        //     ),
        //   ),
        // ),
        // title: Text('Checkout',
        //     // // textScaleFactor: textScaleFactor,
        //     style: TextStyle(
        //         color: Colors.black,
        //         fontWeight: FontWeight.bold,
        //         fontSize: tabLayout
        //             ? 35
        //             : largeLayout
        //                 ? 14
        //                 : 18)),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            SizedBox(height: height * 0.03),
            Text('Your order(s)',
                // // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout ? 26 : 18)),
            // Text('12 product(s) from Wee Food',
            //     // // textScaleFactor: textScaleFactor,
            //     style: TextStyle(fontSize: tabLayout ? 20 : 15)),
            SizedBox(height: height * 0.015),
            Container(
              width: double.infinity,
              height: tabLayout ? height * 0.18 : height * 0.14,
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: width * 0.26,
                  height: height * 0.1,
                  padding: EdgeInsets.only(
                    // left: width * 0.02,
                    top: height * 0.01,
                    // right: height * 0.02
                  ),
                  // color: Colors.amber,
                  margin: EdgeInsets.only(right: width * 0.001),
                  child: Column(
                    children: [
                      Container(
                          height: tabLayout ? height * 0.14 : height * 0.1,
                          width: tabLayout ? height * 0.14 : height * 0.1,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.01),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: Image.network(
                              data['data']['cartItem'][index]['mainImage'])),
                      Text(
                        data['data']['cartItem'][index]['productName'],
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 25 : 14),
                      ),
                    ],
                  ),
                ),
                itemCount: data['data']['cartItem'].length,
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              // height: height * 0.18,
              // color: Colors.red,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13)),
                      Text('₹${data['data']['grandTotal']}',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coupon',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13)),
                      Text(
                          couponCode == null
                              ? 'No Coupon Selected'
                              : amount <= data['data']['grandTotal']
                                  ? '$couponCode Applied'
                                  : 'Not Applicable',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13)),
                      Text('₹10',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13)),
                      Text('₹${taxAmount.toString()}',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Payment Method',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout ? 20 : 13)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Padding(
              padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
              child: Container(
                width: double.infinity,
                height: tabLayout
                    ? height * 0.1
                    : largeLayout
                        ? height > 800
                            ? height * 0.12
                            : height * 0.14
                        : height * 0.18,
                padding:
                    EdgeInsets.only(left: width * 0.04, right: height * 0.02),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cash On Delivery',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 22
                                  : largeLayout
                                      ? 13
                                      : 12),
                        ),
                        Radio(
                            value: 1,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as int;
                              });
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Razorpay',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 22
                                  : largeLayout
                                      ? 13
                                      : 12),
                        ),
                        Radio(
                            value: 2,
                            groupValue: selectedValue,
                            onChanged: (value) {
                              setState(() {
                                selectedValue = value as int;
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  // // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 26
                          : largeLayout
                              ? 18
                              : 16),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/address-list'),
                  child: Text(
                    'Change Location',
                    // // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        // fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 20
                            : largeLayout
                                ? 14
                                : 12),
                  ),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height:
                  !tabLayout && !largeLayout ? height * 0.25 : height * 0.18,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Row(
                      //   children: [
                      //     Container(
                      //       decoration: BoxDecoration(
                      //           shape: BoxShape.circle,
                      //           border:
                      //               Border.all(color: Colors.black, width: 2)),
                      //       child: CircleAvatar(
                      //         radius: tabLayout ? 25 : 18,
                      //         backgroundColor: Colors.white,
                      //         child: Icon(Icons.assistant_direction_rounded,
                      //             color: Colors.green,
                      //             size: tabLayout ? 40 : 24),
                      //       ),
                      //     ),
                      //     SizedBox(width: width * 0.03),
                      //     Expanded(
                      //       child: Text(
                      //         '124, Park Street, Kolkata: 700016, West Bengal',
                      //         // overflow: TextOverflow.ellipsis,
                      //         // // textScaleFactor: textScaleFactor,
                      //         style: TextStyle(
                      //             color: Colors.black,
                      //             fontSize: tabLayout ? 20 : 12),
                      //       ),
                      //     )
                      //   ],
                      // ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: CircleAvatar(
                              radius: tabLayout ? 25 : 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.green,
                                  size: tabLayout ? 40 : 24),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              // '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal',
                              // overflow: TextOverflow.ellipsis,
                              // // textScaleFactor: textScaleFactor,
                              defaultAddress,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: tabLayout ? 20 : 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  // Positioned(
                  //   top: !tabLayout && !largeLayout
                  //       ? height * 0.07
                  //       : height * 0.0472,
                  //   left: tabLayout
                  //       ? width * 0.026
                  //       : largeLayout
                  //           ? width * 0.042
                  //           : width * 0.055,
                  //   child: Container(
                  //     width: width * 0.01,
                  //     height: !tabLayout && !largeLayout
                  //         ? height * 0.07
                  //         : height * 0.045,
                  //     color: Colors.white,
                  //     child: Column(
                  //       children: [
                  //         Container(
                  //             width: double.infinity,
                  //             height: !tabLayout && !largeLayout
                  //                 ? height * 0.01
                  //                 : height * 0.006,
                  //             color: Colors.green,
                  //             margin: EdgeInsets.only(bottom: height * 0.002)),
                  //         Container(
                  //             width: double.infinity,
                  //             height: !tabLayout && !largeLayout
                  //                 ? height * 0.01
                  //                 : height * 0.006,
                  //             color: Colors.green,
                  //             margin: EdgeInsets.only(bottom: height * 0.002)),
                  //         Container(
                  //             width: double.infinity,
                  //             height: !tabLayout && !largeLayout
                  //                 ? height * 0.01
                  //                 : height * 0.006,
                  //             color: Colors.green,
                  //             margin: EdgeInsets.only(bottom: height * 0.002)),
                  //         Container(
                  //             width: double.infinity,
                  //             height: !tabLayout && !largeLayout
                  //                 ? height * 0.01
                  //                 : height * 0.006,
                  //             color: Colors.green,
                  //             margin: EdgeInsets.only(bottom: height * 0.002)),
                  //         Container(
                  //             width: double.infinity,
                  //             height: !tabLayout && !largeLayout
                  //                 ? height * 0.01
                  //                 : height * 0.006,
                  //             color: Colors.green,
                  //             margin: EdgeInsets.only(bottom: height * 0.002)),
                  //         Container(
                  //           width: double.infinity,
                  //           height: !tabLayout && !largeLayout
                  //               ? height * 0.01
                  //               : height * 0.005,
                  //           color: Colors.green,
                  //           // margin: EdgeInsets.only(bottom: height * 0.002)
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.3, right: width * 0.3),
              child: InkWell(
                onTap: () async {
                  selectedValue == 1 ? codCheckOut() : razorPayCheckout();
                },
                child: Container(
                  width: width * 0.1,
                  height: !tabLayout && !largeLayout
                      ? height * 0.08
                      : height * 0.06,
                  // margin: EdgeInsets.only(bottom: height * 0.15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(
                          !tabLayout && !largeLayout ? 10 : 20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ]),
                  child: Center(
                    child: Text(
                      'PAY',
                      // // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout ? 30 : 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: height * 0.05)
          ],
        ),
      ),
    );
  }
}
