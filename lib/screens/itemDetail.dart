import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/curvedAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../model/addToCart/addToCart.dart';
import 'dart:convert';
import '../model/wishList/wishList.dart';
import '../model/addToCart/addToCart.dart';

class ItemDetails extends StatefulWidget {
  ItemDetailsState createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetails> {
  double rating = 0;
  int counter = 0;
  double itemPrice = 0.0;
  bool isClicked = false;
  bool isLoading = true;

  final List<dynamic> _categoryItems = [
    {
      'id': 1,
      'name': 'Tomatoes',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/tomato-15559.png'
    },
    {
      'id': 2,
      'name': 'Cabbage',
      'discountPrice': '30.00/KG',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/PngItem_1310699.png'
    },
    {
      'id': 3,
      'name': 'Onions',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/tomato-15559.png'
    },
    {
      'id': 4,
      'name': 'Turnip',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/PngItem_1310699.png'
    }
  ];

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      setState(() {
        isLoading = true;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final route =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final id = route['id'];
    final wishListId = route['wishListId'];
    final image = route['image'];
    final name = route['name'];
    // var quantity = route['quantity'];
    final description = route['description'];
    final price = route['price'];
    int quantity = route['quantity'];
    final provider = Provider.of<AddToCartProvider>(context).cartData;
    int length = 0;

    setState(() {
      counter = quantity;
      length = Provider.of<AddToCartProvider>(context)
          .cartData['data']['cartItem']
          .length;
      print('Length $length');
    });

    // counter = quantity;

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: Column(
          children: [
            ClipPath(
              clipper: CurvedAppBar(),
              child: Stack(
                children: [
                  Container(
                    height: height * 0.35,
                    width: double.infinity,
                    color: const Color.fromRGBO(242, 243, 250, 1),
                  ),
                  Positioned(
                      top: height * 0.04,
                      left: tabLayout ? width * 0.85 : width * 0.81,
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              isClicked = !isClicked;
                            });
                            Provider.of<WishListProvider>(context,
                                    listen: false)
                                .wishListAdd(id);
                          },
                          child: !isClicked
                              ? Icon(Icons.favorite_outline,
                                  size: tabLayout ? 40 : 20)
                              : Icon(Icons.favorite,
                                  color: Colors.pink,
                                  size: tabLayout ? 40 : 20))),
                  Positioned(
                      top: height * 0.04,
                      left: tabLayout ? width * 0.92 : width * 0.9,
                      child: InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/cart-screen'),
                          child: Icon(Icons.shopping_cart_outlined,
                              size: tabLayout ? 40 : 20))),
                  length == 0
                      ? const SizedBox()
                      : Positioned(
                          top: tabLayout ? height * 0.028 : height * 0.035,
                          left: width * 0.94,
                          child: CircleAvatar(
                            radius: width * 0.02,
                            backgroundColor: Colors.green,
                            child: Center(
                              child: length < 10
                                  ? Text(length.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: tabLayout ? 20 : 10,
                                          fontWeight: FontWeight.bold))
                                  : Text('9+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: tabLayout ? 18 : 8,
                                          fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                  Positioned(
                    top: height * 0.04,
                    left: width * 0.02,
                    child: Container(
                      width: width * 0.1,
                      height: tabLayout ? height * 0.07 : height * 0.05,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.02),
                            child: Icon(Icons.arrow_back_ios,
                                color: Colors.green, size: tabLayout ? 40 : 14),
                          )),
                    ),
                  ),
                  Positioned(
                    top: height * 0.07,
                    // left: width * 0.22,
                    left: 0,
                    right: 0,
                    // child: Image.asset(
                    //   image,
                    //   height: height * 0.2
                    //   ),
                    child: Image.network('http://3.109.206.91:8000$image',
                        height: tabLayout ? height * 0.25 : height * 0.2),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: height * 0.28,
              // color: Colors.red,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout ? 40 : 25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: height * 0.04,
                        width: width * 0.4,
                        // color: Colors.green,
                        child: Row(
                          children: [
                            RatingBar.builder(
                              allowHalfRating: true,
                              minRating: 1,
                              itemSize: tabLayout ? 35 : 24,
                              // itemPadding: EdgeInsets.symmetric(
                              //     horizontal: 0.05, vertical: 0.05),
                              itemBuilder: (context, _) =>
                                  const Icon(Icons.star, color: Colors.black),
                              onRatingUpdate: (double value) {
                                setState(() {
                                  rating = value;
                                });
                              },
                            ),
                            Text('($rating)',
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: tabLayout ? 25 : 14)),
                            // Container(
                            //     width: width * 0.4,
                            //     height: height * 0.1,
                            //     color: Colors.amber)
                          ],
                        ),
                      ),
                      Container(
                        width: width * 0.45,
                        height: height * 0.06,
                        // color: Colors.amber,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (route['quantity'] != 0) {
                                    // route['quantity']--;
                                    itemPrice = price * --route['quantity'];
                                  } else {
                                    route['quantity'] = 0;
                                  }
                                  print(route['quantity']);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(0, 1))
                                    ]),
                                child: CircleAvatar(
                                  radius: tabLayout ? 28 : 18,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.remove_sharp,
                                      color: Colors.black,
                                      size: tabLayout ? 40 : 30),
                                ),
                              ),
                            ),
                            SizedBox(width: width * 0.04),
                            Text(counter.toString(),
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout ? 40 : 22)),
                            SizedBox(width: width * 0.04),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // route['quantity']++;
                                  itemPrice = price * ++route['quantity'];
                                  print(route['quantity']);
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 10,
                                          offset: Offset(0, 1))
                                    ]),
                                child: CircleAvatar(
                                  radius: tabLayout ? 28 : 18,
                                  backgroundColor: Colors.white,
                                  child: Icon(Icons.add,
                                      color: Colors.black,
                                      size: tabLayout ? 40 : 30),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.178,
                    // color: Colors.blue,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Description',
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout ? 30 : 18)),
                        SizedBox(height: height * 0.005),
                        Expanded(
                          child: Text(description.toString(),
                              // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: tabLayout ? 25 : 13)),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            Container(
              width: double.infinity,
              height: height * 0.2,
              // color: Colors.red,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Offers On',
                      // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: tabLayout ? 30 : 18)),
                  SizedBox(height: height * 0.02),
                  Container(
                    width: double.infinity,
                    height: tabLayout ? height * 0.15 : height * 0.14,
                    // color: Colors.amber,
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => Container(
                        width: width * 0.25,
                        height: height * 0.1,
                        // color: Colors.white,
                        margin: EdgeInsets.only(right: width * 0.01),
                        child: Column(
                          children: [
                            Container(
                              // padding: EdgeInsets.symmetric(
                              //     vertical: height * 0.02,
                              //     horizontal: width * 0.04),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ]),
                              child: Image.asset(
                                  'assets/images/tomato-15559.png',
                                  height:
                                      tabLayout ? height * 0.12 : height * 0.1,
                                  width:
                                      tabLayout ? width * 0.18 : height * 0.1),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(_categoryItems[index]['name'],
                                // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout ? 20 : 14))
                          ],
                        ),
                      ),
                      itemCount: _categoryItems.length,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.027),
            Container(
              width: double.infinity,
              height: height * 0.1,
              color: Colors.white,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Price',
                      // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.black, fontSize: tabLayout ? 45 : 20)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Text(
                      //   '₹',
                      //   // textScaleFactor: textScaleFactor,
                      //   style: TextStyle(
                      //       color: Colors.black,
                      //       fontWeight: FontWeight.bold,
                      //       fontSize: 40),
                      // ),
                      Text(
                        // '₹${price.toString()}',
                        '₹${itemPrice.toString()}',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 45 : 40),
                      ),
                      // SizedBox(width: width * 0.1),
                      itemPrice == 0.0
                          ? Container(
                              width: tabLayout ? width * 0.4 : width * 0.3,
                              height: tabLayout ? height * 0.05 : height * 0.04,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: Colors.grey,
                                    style: BorderStyle.solid),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       blurRadius: 5,
                                //       offset: Offset(0, 2))
                                // ]
                              ),
                              child: Center(
                                  child: Text('Add To Cart',
                                      // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout ? 20 : 14))),
                            )
                          : InkWell(
                              onTap: () =>
                                  cartAdd(id, quantity, context, provider),
                              child: Container(
                                width: tabLayout ? width * 0.4 : width * 0.3,
                                height:
                                    tabLayout ? height * 0.05 : height * 0.04,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: Colors.green,
                                        style: BorderStyle.solid),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 5,
                                          offset: Offset(0, 2))
                                    ]),
                                child: Center(
                                    child: Text('Add To Cart',
                                        // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout ? 20 : 14))),
                              ),
                            )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void cartAdd(int productId, int quantity, BuildContext context,
      Map<String, dynamic> provider) async {
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .postToCart(productId, quantity);
    final res = json.decode(response.body);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setInt('cartLength', provider['data']['cartItem'].length);

    print(res);
    if (res['data']['message'] == 'Product added to cart.') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Product Added To Cart',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.green,
        action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar()),
      ));
    }
    if (res['data']['message'] == 'Product available in cart.') {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: const Text('Product Already Available In Cart',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.green,
          action: SnackBarAction(
            textColor: Colors.white,
            label: 'OK',
            onPressed: () =>
                ScaffoldMessenger.of(context).hideCurrentSnackBar(),
          )));
    }
  }
}
