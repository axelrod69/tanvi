import 'package:flutter/material.dart';
import 'package:tanvi/model/addToCart/addToCartModel.dart';
import '../widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';
import '../model/addToCart/addToCart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  CartScreenState createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  bool isLoading = true;
  Map<String, dynamic> updatedProducts = {};
  double totalPrice = 0.0;
  double totalAmount = 0.0;
  double grand = 0.0;
  int index = 0;
  double tax = 0.0;
  Map<String, dynamic> _cartList = {};
  String? couponCode;
  double amount = 0;
  String? minOrder;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      setState(() {
        totalAmount = Provider.of<AddToCartProvider>(context, listen: false)
            .cartData['data']['grandTotal'];

        isLoading = false;
        // totalPrice = response['data']['grandTotal'];
      });
      print('Total Price: $totalPrice');
    });
    getCoupon();
    // getTotalPriceCalculation();
    // updateCart;
    // updateCall;
    super.didChangeDependencies();
  }

  // Future<void> getTotalPriceCalculation() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   setState(() {
  //     localStorage.setDouble('counter', 0.0);
  //     totalPrice = localStorage.getDouble('counter')!;
  //   });
  // }

  double get taxCalculation {
    final taxCalculation =
        Provider.of<AddToCartProvider>(context, listen: false).cartData;
    for (final cartItem in taxCalculation['data']['cartItem']) {
      tax += (cartItem['tax'] as num) / 100.0;
    }
    print('Tax: $tax');
    return tax;
  }

  Future<void> getCoupon() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    couponCode = localStorage.getString('couponCode');
    minOrder = localStorage.getString('couponAmount');
    amount = double.parse(minOrder!);
    print('Code: $couponCode');
    print('Min Order: $amount');
  }

  void updateCall() async {
    // _cartList = await Provider.of<AddToCartProvider>(context, listen: false)
    //     .getCartProducts();
    Provider.of<AddToCartProvider>(context, listen: false).getCartProducts();
  }

  void updateCartIncrease(Map<String, dynamic> data, double grandTotal) async {
    print('Data: $data');
    print('Grand Total: $grandTotal');
    setState(() {
      if (totalAmount > 0) {
        totalAmount += data['price'];
      } else {
        totalAmount = grandTotal + data['price'];
      }
      print('Total Priceeeeeeeeeeeeeeeee D $totalAmount');
    });
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .editCartItem(data['id'], data['quantity']);
  }

  void updateCartDecrease(Map<String, dynamic> data, double grandTotal) async {
    print('Data: $data');
    print('Grand Total: $grandTotal');
    setState(() {
      if (totalAmount > 0) {
        totalAmount -= data['price'];
      } else {
        if (data['quantity'] > 0) {
          totalAmount = grandTotal - data['price'];
        }
      }
      print('Total Priceeeeeeeeeeeeeeeee D $totalAmount');
    });

    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .editCartItem(data['id'].toString(), data['quantity']);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<AddToCartProvider>(context).cartData;

    var price = 0.0;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // print('Total ${provider['data']['grandTotal']}');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Shopping List',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: tabLayout
                    ? 35
                    : largeLayout
                        ? 19
                        : 16)),
      ),
      body: isLoading
          ? const Center(
              child: Text(
                'Cart Is Empty',
              ),
            )
          : Container(
              height: height * 1,
              width: width * 1,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle 392.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: !tabLayout && !largeLayout
                                ? height * 0.008
                                : height * 0.02,
                            right: width * 0.02),
                        child: Row(
                          children: [
                            Icon(Icons.delete_forever,
                                color: Colors.red,
                                size: tabLayout
                                    ? 40
                                    : largeLayout
                                        ? 24
                                        : 20),
                            Text('Remove All',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout ? 25 : 14))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: !tabLayout && !largeLayout
                        ? height * 0.52
                        : height * 0.6,
                    // color: Colors.amber,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        height: tabLayout
                            ? height * 0.15
                            : largeLayout
                                ? height * 0.11
                                : height * 0.14,
                        width: double.infinity,
                        margin: EdgeInsets.only(bottom: height * 0.04),
                        // color: Colors.red,
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                width: width * 0.55,
                                // color: Colors.amber,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: height * 0.012,
                                          bottom: height * 0.012),
                                      child: Container(
                                        width: width * 0.25,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                color: Colors.green,
                                                width: 1,
                                                style: BorderStyle.solid),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2))
                                            ],
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(10),
                                                    bottomRight:
                                                        Radius.circular(10))),
                                        child: Image.network(provider['data']
                                            ['cartItem'][index]['mainImage']),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: double.infinity,
                                        // color: Colors.green,
                                        padding: EdgeInsets.only(
                                            left: width * 0.02,
                                            top: height * 0.005),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              '₹${provider['data']['cartItem'][index]['price']}',
                                              // price.toString(),
                                              // // textScaleFactor: textScaleFactor,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      tabLayout ? 25 : 14),
                                            ),
                                            Text(
                                              provider['data']['cartItem']
                                                  [index]['productName'],
                                              // // textScaleFactor: textScaleFactor,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      tabLayout ? 25 : 14),
                                            ),
                                            // SizedBox(height: height * 0.02),
                                            Text(
                                              provider['data']['cartItem']
                                                      [index]['quantity']
                                                  .toString(),
                                              // // textScaleFactor: textScaleFactor,
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize:
                                                      tabLayout ? 25 : 14),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              fit: FlexFit.tight,
                              child: Container(
                                height: double.infinity,
                                // color: Colors.blue,
                                margin: EdgeInsets.only(right: width * 0.02),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (provider['data']['cartItem']
                                                    [index]['quantity'] >
                                                1) {
                                              provider['data']['cartItem']
                                                  [index]['quantity']--;
                                              updateCartDecrease(
                                                  provider['data']['cartItem']
                                                      [index],
                                                  provider['data']
                                                      ['grandTotal']);
                                            } else {
                                              Provider.of<AddToCartProvider>(
                                                      context,
                                                      listen: false)
                                                  .deleteCartItem(
                                                      provider['data']
                                                              ['cartItem']
                                                          [index]['id']);

                                              print('Rachhel Sekh');
                                            }
                                          });
                                        },
                                        child: Icon(Icons.remove,
                                            size: tabLayout
                                                ? 45
                                                : largeLayout
                                                    ? 30
                                                    : 25)),
                                    Container(
                                      // height: height * 0.2,
                                      width: !tabLayout && !largeLayout
                                          ? width * 0.1
                                          : width * 0.12,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.green,
                                              width: 2,
                                              style: BorderStyle.solid),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 2))
                                          ]),
                                      child: Center(
                                        child: Text(
                                            provider['data']['cartItem'][index]
                                                    ['quantity']
                                                .toString(),
                                            // // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: tabLayout
                                                    ? 40
                                                    : largeLayout
                                                        ? 18
                                                        : 14)),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            provider['data']['cartItem'][index]
                                                ['quantity']++;
                                            print(provider['data']['cartItem']
                                                [index]['quantity']);
                                            updateCartIncrease(
                                                provider['data']['cartItem']
                                                    [index],
                                                provider['data']['grandTotal']);
                                          });
                                        },
                                        child: Icon(Icons.add,
                                            size: tabLayout
                                                ? 45
                                                : largeLayout
                                                    ? 30
                                                    : 22)),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      itemCount: provider['data']['cartItem'].length,
                    ),
                  ),
                  Divider(
                    height: !tabLayout && !largeLayout
                        ? height * 0.005
                        : height * 0.01,
                    color: Colors.grey,
                    thickness: !tabLayout && !largeLayout ? 1 : 2,
                    indent: !tabLayout && !largeLayout ? 20 : 30,
                    endIndent: !tabLayout && !largeLayout ? 20 : 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.082, right: height * 0.04),
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/checkout-screen', arguments: {
                        'data': provider,
                        'tax': taxCalculation,
                        'discountCode': couponCode
                      }),
                      child: Container(
                          width: double.infinity,
                          height: tabLayout
                              ? height * 0.08
                              : largeLayout
                                  ? height * 0.06
                                  : height * 0.07,
                          margin: EdgeInsets.only(
                              top:
                                  height > 800 ? height * 0.04 : height * 0.012,
                              bottom: height > 800 ? height * 0.04 : 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.green,
                                    blurRadius: 10,
                                    offset: Offset(0, 2))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: width * 0.04),
                                child: Text('Checkout',
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: tabLayout
                                            ? 35
                                            : largeLayout
                                                ? 22
                                                : 18)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.04),
                                child: Text(
                                    // '₹${provider['data']['grandTotal']}',
                                    '₹$totalAmount',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 35
                                            : largeLayout
                                                ? 22
                                                : 18)),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
