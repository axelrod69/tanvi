import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../util/curvedAppBar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import '../model/addToCart/addToCart.dart';
import 'dart:convert';
import '../model/wishList/wishList.dart';
import '../model/addToCart/addToCart.dart';
import '../model/products/productsProvider.dart';
import '../model/rating/ratingProvider.dart';

class ItemDetails extends StatefulWidget {
  ItemDetailsState createState() => ItemDetailsState();
}

class ItemDetailsState extends State<ItemDetails> {
  double rating = 0;
  int counter = 0;
  double itemPrice = 0.0;
  bool isClicked = false;
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      Provider.of<ProductsProvider>(context, listen: false)
          .getProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
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
    final productsProvider = Provider.of<ProductsProvider>(context).products;
    int length = 0;

    setState(() {
      counter = quantity;
      length = Provider.of<AddToCartProvider>(context)
          .cartData['data']['cartItem']
          .length;
      itemPrice = price * counter.toDouble();
      print('Item Price: $itemPrice');
      print('Counter $counter');
      print('Length $length');
    });

    // counter = quantity;

    // TODO: implement build
    return Scaffold(
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
                            top: !tabLayout && !largeLayout
                                ? height * 0.05
                                : height * 0.04,
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
                            top: !tabLayout && !largeLayout
                                ? height * 0.05
                                : height * 0.04,
                            left: tabLayout ? width * 0.92 : width * 0.9,
                            child: InkWell(
                                onTap: () => Navigator.of(context)
                                    .pushNamed('/cart-screen'),
                                child: Icon(Icons.shopping_cart_outlined,
                                    size: tabLayout ? 40 : 20))),
                        length == 0
                            ? const SizedBox()
                            : Positioned(
                                top: tabLayout
                                    ? height * 0.028
                                    : largeLayout
                                        ? height * 0.035
                                        : height * 0.048,
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
                          top: !tabLayout && !largeLayout
                              ? height * 0.05
                              : height * 0.04,
                          left: width * 0.02,
                          child: Container(
                            width: !tabLayout && !largeLayout
                                ? width * 0.12
                                : width * 0.1,
                            height: tabLayout
                                ? height * 0.07
                                : largeLayout
                                    ? height * 0.05
                                    : height * 0.08,
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
                                      color: Colors.green,
                                      size: tabLayout
                                          ? 40
                                          : largeLayout
                                              ? 14
                                              : 18),
                                )),
                          ),
                        ),
                        Positioned(
                          top: !tabLayout && !largeLayout
                              ? height * 0.085
                              : height * 0.07,
                          // left: width * 0.22,
                          left: 0,
                          right: 0,
                          // child: Image.asset(
                          //   image,
                          //   height: height * 0.2
                          //   ),
                          child: Image.network('http://54.80.135.220$image',
                              height: tabLayout ? height * 0.25 : height * 0.2),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: height * 0.28,
                    // color: Colors.red,
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name,
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout
                                    ? 40
                                    : largeLayout
                                        ? 25
                                        : 20)),
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
                                    itemSize: tabLayout
                                        ? 35
                                        : largeLayout
                                            ? 24
                                            : 18,
                                    // itemPadding: EdgeInsets.symmetric(
                                    //     horizontal: 0.05, vertical: 0.05),
                                    itemBuilder: (context, _) => const Icon(
                                        Icons.star,
                                        color: Colors.yellow),
                                    onRatingUpdate: (double value) {
                                      setState(() {
                                        rating = value;
                                      });
                                      Provider.of<RatingProvider>(context,
                                              listen: false)
                                          .postRating(
                                              id.toString(), value.toString());
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
                              height: !tabLayout && !largeLayout
                                  ? height * 0.05
                                  : height * 0.06,
                              // color: Colors.amber,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (route['quantity'] != 0) {
                                          // route['quantity']--;
                                          itemPrice =
                                              price * --route['quantity'];
                                        } else {
                                          route['quantity'] = 0;
                                        }
                                        print(route['quantity']);
                                      });
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: CircleAvatar(
                                        radius: tabLayout
                                            ? 28
                                            : largeLayout
                                                ? 18
                                                : 16,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.remove_sharp,
                                            color: Colors.black,
                                            size: tabLayout
                                                ? 40
                                                : largeLayout
                                                    ? 30
                                                    : 25),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: width * 0.04),
                                  Text(counter.toString(),
                                      // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? 40
                                              : largeLayout
                                                  ? 22
                                                  : 18)),
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
                                          borderRadius:
                                              BorderRadius.circular(18),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 10,
                                                offset: Offset(0, 1))
                                          ]),
                                      child: CircleAvatar(
                                        radius: tabLayout
                                            ? 28
                                            : largeLayout
                                                ? 18
                                                : 16,
                                        backgroundColor: Colors.white,
                                        child: Icon(Icons.add,
                                            color: Colors.black,
                                            size: tabLayout
                                                ? 40
                                                : largeLayout
                                                    ? 30
                                                    : 18),
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
                                      fontSize: tabLayout
                                          ? 30
                                          : largeLayout
                                              ? 18
                                              : 16)),
                              SizedBox(height: height * 0.005),
                              Expanded(
                                child: Text(description.toString(),
                                    // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: tabLayout
                                            ? 25
                                            : largeLayout
                                                ? 13
                                                : 11)),
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
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Offers On',
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: tabLayout
                                    ? 30
                                    : largeLayout
                                        ? 18
                                        : 14)),
                        SizedBox(height: height * 0.02),
                        Container(
                          width: double.infinity,
                          height: tabLayout ? height * 0.15 : height * 0.14,
                          // color: Colors.amber,
                          padding: EdgeInsets.only(left: width * 0.02),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/item-details', arguments: {
                                  'id': productsProvider['data'][index]['id'],
                                  'image': productsProvider['data'][index]
                                      ['main_image'],
                                  'name': productsProvider['data'][index]
                                      ['name'],
                                  'quantity': 0,
                                  'description': productsProvider['data'][index]
                                      ['description'],
                                  'price': productsProvider['data'][index]
                                      ['price']
                                });
                                // print(
                                //     'Quantity Print ${_categoryItems[index]['quantity']}');
                              },
                              child: Container(
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
                                          borderRadius: BorderRadius.circular(
                                              !tabLayout && !largeLayout
                                                  ? 10
                                                  : 20),
                                          color: Colors.white,
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5,
                                                offset: Offset(0, 2))
                                          ]),
                                      child: Image.network(
                                          'http://54.80.135.220${productsProvider['data'][index]['main_image']}',
                                          height: tabLayout
                                              ? height * 0.12
                                              : height * 0.1,
                                          width: tabLayout
                                              ? width * 0.18
                                              : largeLayout
                                                  ? height * 0.1
                                                  : height * 0.13),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Text(
                                        productsProvider['data'][index]['name'],
                                        // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 20
                                                : largeLayout
                                                    ? 14
                                                    : 12))
                                  ],
                                ),
                              ),
                            ),
                            itemCount: productsProvider['data'].length,
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
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price',
                            // textScaleFactor: textScaleFactor,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: tabLayout
                                    ? 45
                                    : largeLayout
                                        ? 20
                                        : 12)),
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
                                  fontSize: tabLayout
                                      ? 45
                                      : largeLayout
                                          ? 40
                                          : 32),
                            ),
                            // SizedBox(width: width * 0.1),
                            itemPrice == 0.0
                                ? Container(
                                    width:
                                        tabLayout ? width * 0.4 : width * 0.3,
                                    height: tabLayout
                                        ? height * 0.05
                                        : height * 0.04,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                          !tabLayout && !largeLayout ? 5 : 10),
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
                                                fontSize: tabLayout
                                                    ? 20
                                                    : largeLayout
                                                        ? 14
                                                        : 12))),
                                  )
                                : InkWell(
                                    onTap: () {
                                      cartAdd(id, quantity, context, provider);
                                      // provider.forEach((key, value) {
                                      //   if (provider['data']['cartItem']
                                      //       .containsValue(value['id'])) {
                                      //     return null;
                                      //   } else {
                                      //     int length =
                                      //         provider['data']['cartlength']++;
                                      //     Provider.of<AddToCartProvider>(
                                      //             context,
                                      //             listen: false)
                                      //         .cartlength(length);
                                      //   }
                                      // });
                                    },
                                    child: Container(
                                      width:
                                          tabLayout ? width * 0.4 : width * 0.3,
                                      height: tabLayout
                                          ? height * 0.05
                                          : height * 0.04,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                                  fontSize:
                                                      tabLayout ? 20 : 14))),
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
