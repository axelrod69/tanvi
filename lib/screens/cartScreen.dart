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
  double? totalAmount;
  Map<String, dynamic> _cartList = {};

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      setState(() {
        // totalPrice = Provider.of<AddToCartProvider>(context, listen: false)
        //     .cartData['data']['grandTotal'];
        isLoading = false;
        // totalPrice = response['data']['grandTotal'];
      });
    });
    // updateCart;
    // updateCall;
    super.didChangeDependencies();
  }

  void updateCall() async {
    _cartList = await Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts();
  }

  void updateCartIncrease(
      String id, int quantity, double amount, double grandTotal) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print('Called');
    print('Quantity $quantity');
    totalPrice = grandTotal;
    setState(() {
      totalPrice += amount * 1.0;
    });
    print('Total Priceeeeeeeeeeeeeeeee $totalPrice');
    localStorage.setDouble('totalAmount', totalPrice);
    totalAmount = localStorage.getDouble('totalAmount');
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .editCartItem(id, quantity);
  }

  void updateCartDecrease(
      String id, int quantity, double amount, double grandTotal) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    print('Called');
    print('Quantity $quantity');
    totalPrice = grandTotal;
    setState(() {
      // totalPrice = grandTotal;
      totalPrice -= amount * 1.0;
      // totalPrice = grandTotal;
    });
    print('Total Priceeeeeeeeeeeeeeeee D $totalPrice');
    localStorage.setDouble('totalAmount', totalPrice);
    totalAmount = localStorage.getDouble('totalAmount');
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .editCartItem(id, quantity);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<AddToCartProvider>(context).cartData;
    var price = 0.0;

    // print('Total ${provider['data']['grandTotal']}');

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: const Text('Shopping List',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
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
                            top: height * 0.02, right: width * 0.02),
                        child: Row(
                          children: const [
                            const Icon(Icons.delete_forever, color: Colors.red),
                            Text('Remove All',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                ))
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    height: height * 0.6,
                    // color: Colors.amber,
                    child: ListView.builder(
                      itemBuilder: (context, index) => Container(
                        height: height * 0.11,
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
                                              provider['data']['cartItem']
                                                      [index]['price']
                                                  .toString(),
                                              // price.toString(),
                                              // // textScaleFactor: textScaleFactor,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              provider['data']['cartItem']
                                                  [index]['productName'],
                                              // // textScaleFactor: textScaleFactor,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            // SizedBox(height: height * 0.02),
                                            Text(
                                              provider['data']['cartItem']
                                                      [index]['quantity']
                                                  .toString(),
                                              // // textScaleFactor: textScaleFactor,
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
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
                                                0) {
                                              provider['data']['cartItem']
                                                  [index]['quantity']--;
                                              print(provider['data']['cartItem']
                                                  [index]['quantity']);
                                              print(
                                                  'Item Total ${provider['data']['cartItem'][index]['totalPrice']}');
                                              updateCartDecrease(
                                                  provider['data']['cartItem']
                                                          [index]['id']
                                                      .toString(),
                                                  provider['data']['cartItem']
                                                      [index]['quantity'],
                                                  provider['data']['cartItem']
                                                      [index]['price'],
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
                                        child:
                                            const Icon(Icons.remove, size: 30)),
                                    Container(
                                      // height: height * 0.2,
                                      width: width * 0.12,
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
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          setState(() {
                                            provider['data']['cartItem'][index]
                                                ['quantity']++;
                                            print(provider['data']['cartItem']
                                                [index]['quantity']);
                                            // print(
                                            //     'Increase ${provider['data']['grandTotal']}');
                                            // totalPrice +=
                                            //     provider['data']['totalPrice'];
                                            // print('total $totalPrice');
                                            updateCartIncrease(
                                                provider['data']['cartItem']
                                                        [index]['id']
                                                    .toString(),
                                                provider['data']['cartItem']
                                                    [index]['quantity'],
                                                provider['data']['cartItem']
                                                    [index]['price'],
                                                provider['data']['grandTotal']);
                                            // updateCall();
                                          });
                                        },
                                        child: const Icon(Icons.add, size: 30)),
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
                    height: height * 0.01,
                    color: Colors.grey,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.082, right: height * 0.04),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pushNamed(
                          '/checkout-screen',
                          arguments: {'data': provider}),
                      child: Container(
                          width: double.infinity,
                          height: height * 0.06,
                          margin: EdgeInsets.only(
                              top: height * 0.04, bottom: height * 0.04),
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
                                child: const Text('Checkout',
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 22)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: width * 0.04),
                                child: Text(
                                    // '₹500',
                                    // provider['data']['grandTotal'].toString(),
                                    // totalPrice == 0.0
                                    //     ? provider['data']['grandTotal']
                                    //         .toString()
                                    //     : totalPrice.toString(),
                                    totalPrice == 0.0
                                        ? provider['data']['grandTotal']
                                            .toString()
                                        : totalPrice.toString(),
                                    // price.toString(),
                                    // // textScaleFactor: textScaleFactor,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22)),
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
