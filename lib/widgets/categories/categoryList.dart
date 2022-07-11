import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/addToCart/addToCart.dart';
import '../../model/categoryProducts/categoryProductsProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../../model/addToCart/addToCart.dart';

class CategoryList extends StatefulWidget {
  final int id;
  final String categoryName;
  CategoryListState createState() => CategoryListState();

  CategoryList(this.id, this.categoryName);
}

class CategoryListState extends State<CategoryList> {
  // int count = 1;
  bool isLoading = true;
  bool isClicked = false;
  String baseUrl = 'http://34.100.212.22';

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProductsProvider>(context, listen: false)
        .getCategoryProducts(widget.id)
        .then((_) {
      Provider.of<AddToCartProvider>(context, listen: false)
          .getCartProducts()
          .then((_) {
        setState(() {
          isLoading = false;
        });
      });
    });
    // categoryCount();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   // TODO: implement didChangeDependencies
  //   Provider.of<CategoryProductsProvider>(context, listen: false)
  //       .getCategoryProducts(widget.id)
  //       .then((_) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }

  // Future<void> categoryCount() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   count = localStorage.getInt('categoryCounter')!;
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final cartProvider = Provider.of<AddToCartProvider>(context).cartData;
    final provider =
        Provider.of<CategoryProductsProvider>(context).categoryProducts;

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
          toolbarHeight: tabLayout
              ? 100
              : largeLayout
                  ? 55
                  : 60,
          centerTitle: true,
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
                  width:
                      !tabLayout && !largeLayout ? width * 0.12 : width * 0.1,
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
                        ? width * 0.24
                        : largeLayout
                            ? width * 0.16
                            : width * 0.12),
                child: Text(
                  widget.categoryName,
                  // // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 35
                          : largeLayout
                              ? 18
                              : 14),
                ),
              )
            ],
          ),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 392.png'),
                        fit: BoxFit.cover)),
                child: ListView.separated(
                    itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(
                              left: width * 0.02, right: width * 0.02),
                          child: Container(
                            width: double.infinity,
                            // height: height * 0.2,
                            padding: const EdgeInsets.all(8),
                            margin: EdgeInsets.only(top: height * 0.01),
                            // margin: EdgeInsets.only(bottom: height * 0.02),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 8,
                                      offset: Offset(1, 2))
                                ]),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Flexible(
                                      flex: 2,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        height: height * 0.17,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                                color: Colors.green,
                                                width: 2.5),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    'http://34.100.212.22${provider['data'][index]['main_image']}'),
                                                // scale: 1.5,
                                                fit: BoxFit.cover),
                                            boxShadow: const [
                                              BoxShadow(
                                                  color: Colors.grey,
                                                  blurRadius: 8,
                                                  offset: Offset(1, 2))
                                            ]),
                                      ),
                                    ),
                                    SizedBox(width: width * 0.02),
                                    Flexible(
                                      flex: 3,
                                      fit: FlexFit.tight,
                                      child: Container(
                                        height: height * 0.17,
                                        // color: Colors.amber,
                                        child: Column(
                                          children: [
                                            Flexible(
                                                flex: 3,
                                                fit: FlexFit.tight,
                                                child: Container(
                                                  width: double.infinity,
                                                  // color: Colors.red,
                                                  padding: EdgeInsets.only(
                                                      left: width * 0.02,
                                                      top: height * 0.005,
                                                      bottom: height * 0.005),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      AutoSizeText(
                                                        provider['data'][index]
                                                            ['name'],
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Container(
                                                        width: double.infinity,
                                                        height: height * 0.03,
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: width *
                                                                    0.02),
                                                        color: const Color
                                                                .fromARGB(
                                                            255, 214, 214, 214),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            AutoSizeText(
                                                                '${provider['data'][index]['weight']} ${provider['data'][index]['uom']['short_name']}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        15,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .grey[
                                                                        600])),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(children: [
                                                        AutoSizeText(
                                                            '₹${provider['data'][index]['price']}',
                                                            style: const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18)),
                                                      ])
                                                    ],
                                                  ),
                                                )),
                                            Flexible(
                                                flex: 1,
                                                fit: FlexFit.tight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    provider['data'][index][
                                                                'selectedQuantity'] >
                                                            0
                                                        ? Container(
                                                            // color: Colors.red,
                                                            padding: EdgeInsets
                                                                .only(
                                                                    top: height *
                                                                        0.004,
                                                                    bottom:
                                                                        height *
                                                                            0.004),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .end,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {
                                                                    if (provider['data'][index]
                                                                            [
                                                                            'selectedQuantity'] <
                                                                        1) {
                                                                      provider['data']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'selectedQuantity'] = 0;
                                                                    } else {
                                                                      setState(
                                                                          () {
                                                                        provider['data'][index]
                                                                            [
                                                                            'selectedQuantity']--;
                                                                        print(
                                                                            'Decrease: ${provider['data'][index]['selectedQuantity']}');
                                                                      });
                                                                    }
                                                                    print(
                                                                        'Decrease Post SetState: ${provider['data'][index]['selectedQuantity']}');
                                                                    cartDecrease(
                                                                        provider['data'][index]
                                                                            [
                                                                            'id'],
                                                                        provider['data'][index]
                                                                            [
                                                                            'selectedQuantity'],
                                                                        provider['data'][index]
                                                                            [
                                                                            'cartId'],
                                                                        context,
                                                                        cartProvider);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Colors.grey,
                                                                              blurRadius: 8,
                                                                              offset: Offset(1, 1))
                                                                        ]),
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      radius: tabLayout
                                                                          ? 14
                                                                          : largeLayout
                                                                              ? 12
                                                                              : 10,
                                                                      child: const Icon(
                                                                          Icons
                                                                              .remove,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: width *
                                                                        0.02),
                                                                Text(
                                                                  provider['data']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'selectedQuantity']
                                                                      .toString(),
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: tabLayout
                                                                          ? 25
                                                                          : largeLayout
                                                                              ? 18
                                                                              : 10),
                                                                ),
                                                                SizedBox(
                                                                    width: width *
                                                                        0.02),
                                                                InkWell(
                                                                  onTap: () {
                                                                    setState(
                                                                        () {
                                                                      provider['data']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'selectedQuantity']++;
                                                                    });
                                                                    cartIncrease(
                                                                        provider['data'][index]
                                                                            [
                                                                            'id'],
                                                                        provider['data'][index]
                                                                            [
                                                                            'selectedQuantity'],
                                                                        context,
                                                                        cartProvider);
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    decoration: const BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                              color: Colors.grey,
                                                                              blurRadius: 8,
                                                                              offset: Offset(1, 1))
                                                                        ]),
                                                                    child:
                                                                        CircleAvatar(
                                                                      backgroundColor:
                                                                          Colors
                                                                              .white,
                                                                      radius: tabLayout
                                                                          ? 14
                                                                          : largeLayout
                                                                              ? 12
                                                                              : 10,
                                                                      child: const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Colors.black),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                    width: width *
                                                                        0.035),
                                                              ],
                                                            ),
                                                          )
                                                        : Container(
                                                            width: width * 0.25,
                                                            height:
                                                                height * 0.06,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .green,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                boxShadow: const [
                                                                  BoxShadow(
                                                                      color: Colors
                                                                          .grey,
                                                                      blurRadius:
                                                                          8,
                                                                      offset:
                                                                          Offset(
                                                                              1,
                                                                              2))
                                                                ]),
                                                            child: Center(
                                                              child: InkWell(
                                                                onTap: () {
                                                                  // setState(() {
                                                                  // provider['data']
                                                                  //         [
                                                                  //         index]
                                                                  //     [
                                                                  //     'isClicked'] = !provider['data']
                                                                  //         [
                                                                  //         index]
                                                                  //     [
                                                                  //     'isClicked'];
                                                                  // print(
                                                                  //     'Clicked: ${provider['data'][index]['isClicked']}');
                                                                  // });
                                                                  // if (provider['data']
                                                                  //             [
                                                                  //             index]
                                                                  //         [
                                                                  //         'selectedQuantity'] ==
                                                                  //     0) {
                                                                  //   ScaffoldMessenger.of(
                                                                  //           context)
                                                                  //       .showSnackBar(
                                                                  //           SnackBar(
                                                                  //     backgroundColor:
                                                                  //         Colors
                                                                  //             .green,
                                                                  //     content:
                                                                  //         const Text(
                                                                  //       'Selected Quantity Must be 1 or more units',
                                                                  //       style: TextStyle(
                                                                  //           color:
                                                                  //               Colors.white,
                                                                  //           fontWeight: FontWeight.bold),
                                                                  //     ),
                                                                  //     action: SnackBarAction(
                                                                  //         label:
                                                                  //             'OK',
                                                                  //         textColor: Colors
                                                                  //             .white,
                                                                  //         onPressed: () =>
                                                                  //             ScaffoldMessenger.of(context).hideCurrentSnackBar()),
                                                                  //   ));
                                                                  // } else {
                                                                  setState(() {
                                                                    provider['data']
                                                                            [
                                                                            index]
                                                                        [
                                                                        'selectedQuantity'] = 1;
                                                                  });
                                                                  cartAdd(
                                                                      provider['data']
                                                                              [
                                                                              index]
                                                                          [
                                                                          'id'],
                                                                      provider['data'][index]['selectedQuantity'] ==
                                                                              0
                                                                          ? 1
                                                                          : provider['data'][index]
                                                                              [
                                                                              'selectedQuantity'],
                                                                      context,
                                                                      cartProvider);
                                                                  // }
                                                                },
                                                                child:
                                                                    const Text(
                                                                  'Add',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: height * 0.015),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).pushNamed(
                                            '/item-details',
                                            arguments: {
                                              'id': provider['data'][index]
                                                  ['id'],
                                              'image': provider['data'][index]
                                                  ['main_image'],
                                              'name': provider['data'][index]
                                                  ['name'],
                                              'description': provider['data']
                                                  [index]['description'],
                                              'price': provider['data'][index]
                                                  ['price'],
                                              'quantity': provider['data']
                                                  [index]['selectedQuantity'],
                                            });
                                      },
                                      child: const Text('View Details',
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => Divider(
                          // height: height * 0.05,
                          thickness: 1.0,
                          indent: 12,
                          endIndent: 12,
                          color: Colors.grey[400],
                        ),
                    itemCount: provider['data'].length),
              ));
  }

  void cartIncrease(int productId, int quantity, BuildContext context,
      Map<String, dynamic> provider) async {
    final response =
        await Provider.of<AddToCartProvider>(context, listen: false)
            .postToCart(productId, quantity);
    final res = json.decode(response.body);

    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setInt('cartLength', provider['data']['cartItem'].length);
  }

  void cartDecrease(int productId, int quantity, int cartItemId,
      BuildContext context, Map<String, dynamic> provider) async {
    print('Cart Decreaseeeeeeeeeeeee: $quantity');
    if (quantity < 1) {
      await Provider.of<AddToCartProvider>(context, listen: false)
          .deleteCartItem(cartItemId);
    } else {
      final response =
          await Provider.of<AddToCartProvider>(context, listen: false)
              .postToCart(productId, quantity);
      final res = json.decode(response.body);

      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setInt('cartLength', provider['data']['cartItem'].length);
    }
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
