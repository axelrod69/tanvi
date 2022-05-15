import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import '../../model/order/orderProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

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

  void _handlePaymentSuccess(PaymentSuccessResponse paymentSuccessResponse) {
    Fluttertoast.showToast(
        msg: "SUCCESS: " + paymentSuccessResponse.paymentId!,
        toastLength: Toast.LENGTH_LONG);

    print('Payment Success Order ID ${paymentSuccessResponse.orderId}');
    print('Payment Success Payment ID ${paymentSuccessResponse.paymentId}');
    print('Payment Success Signature ${paymentSuccessResponse.signature}');
    // Navigator.of(context).pushNamed('/my-order-screen');
  }

  Future<void> razorPayCheckout() async {
    try {
      Provider.of<OrderProvider>(context, listen: false)
          .postRazorPayOrder()
          .then((_) {
        var options = {
          'key': 'rzp_test_xGrQHFJAeQY8uD',
          'amount': Provider.of<OrderProvider>(context, listen: false)
                  .orderId['data']['amount_due'] /
              100,
          'name': 'Tanvee Order',
          'order_id': Provider.of<OrderProvider>(context, listen: false)
              .orderId['data']['id'],
          // 'order_id': Provider.of<OrderIdProvider>(context, listen: false)
          //     .orderId['id'],
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
    Provider.of<OrderProvider>(context, listen: false).postCodOrder();
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

    final data = routes['data'];

    print('DATA: $data');

    // print('Min Order Amount: ${double.parse(selectedCoupon['min_order_amt'])}');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
              width: width * 0.1,
              margin: EdgeInsets.only(left: width * 0.01),
              //height: height * 0.02,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Center(
                  child: Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: const Icon(Icons.arrow_back_ios, color: Colors.green),
              ))),
        ),
        title: Text('Checkout',
            textScaleFactor: textScaleFactor,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
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
            Text('Your order',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(fontSize: 18)),
            Text('12 product(s) from Wee Food',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(fontSize: 15)),
            SizedBox(height: height * 0.015),
            Container(
              width: double.infinity,
              height: height * 0.14,
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
                          height: height * 0.1,
                          width: height * 0.1,
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
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
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
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('₹${data['data']['grandTotal']}',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coupon',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text(
                          amount <= data['data']['grandTotal']
                              ? '$couponCode Applied'
                              : 'Not Applicable',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('₹10',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tax',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('₹10',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Payment Method',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
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
                height: height * 0.12,
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
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Cash On Delivery',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
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
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13),
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
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'Change Location',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height * 0.18,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.assistant_direction_rounded,
                                  color: Colors.green),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              '124, Park Street, Kolkata: 700016, West Bengal',
                              // overflow: TextOverflow.ellipsis,
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.green),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal',
                              // overflow: TextOverflow.ellipsis,
                              textScaleFactor: textScaleFactor,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * 0.0472,
                    left: width * 0.042,
                    child: Container(
                      width: width * 0.01,
                      height: height * 0.045,
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                            width: double.infinity,
                            height: height * 0.005,
                            color: Colors.green,
                            // margin: EdgeInsets.only(bottom: height * 0.002)
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.3, right: width * 0.3),
              child: InkWell(
                onTap: () =>
                    selectedValue == 1 ? codCheckOut() : razorPayCheckout(),
                child: Container(
                  width: width * 0.1,
                  height: height * 0.06,
                  // margin: EdgeInsets.only(bottom: height * 0.15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.green,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ]),
                  child: Center(
                    child: Text(
                      'PAY',
                      textScaleFactor: textScaleFactor,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
