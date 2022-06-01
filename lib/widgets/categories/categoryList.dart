import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/categoryProducts/categoryProductsProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryList extends StatefulWidget {
  final int id;
  final String categoryName;
  CategoryListState createState() => CategoryListState();

  CategoryList(this.id, this.categoryName);
}

class CategoryListState extends State<CategoryList> {
  int count = 0;
  bool isLoading = true;
  bool isClicked = false;
  String baseUrl = 'http://192.168.0.154:3000';

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<CategoryProductsProvider>(context, listen: false)
        .getCategoryProducts(widget.id)
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    // categoryCount();
    super.initState();
  }

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
      body: Container(
        width: width * 1,
        height: height * 1,
        // padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
        decoration: const BoxDecoration(
            // color: Colors.grey,
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: Container(
          // decoration: const BoxDecoration(
          //     // gradient: RadialGradient(colors: [
          //     //   Colors.grey,
          //     //   const Color.fromRGBO(236, 236, 248, 1),
          //     // ], radius: 0.85, focal: Alignment.center),
          //     ),
          padding: EdgeInsets.only(left: width * 0.011, right: height * 0.011),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 1,
                    crossAxisCount: 2,
                    childAspectRatio: 0.95,
                  ),
                  itemBuilder: (context, index) => Container(
                    decoration: const BoxDecoration(
                        color: Color.fromRGBO(236, 236, 248, 1),
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.grey,
                            ),
                            right: BorderSide(
                              color: Colors.grey,
                            ))
                        // : const Border(
                        //     bottom: BorderSide(
                        //       color: Colors.grey,
                        //     ),
                        //     left: BorderSide(
                        //       color: Colors.grey,
                        //     )),
                        ),
                    child: Stack(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed('/item-details', arguments: {
                                  'id': provider['data'][index]['id'],
                                  'image': provider['data'][index]
                                      ['main_image'],
                                  'name': provider['data'][index]['name'],
                                  'quantity': provider['data'][index]
                                      ['selectedQuantity'],
                                  'description': provider['data'][index]
                                      ['description'],
                                  'price': provider['data'][index]['price']
                                });
                                // print(
                                //     'Quantity Print ${_categoryItems[index]['quantity']}');
                              },
                              child: Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: tabLayout
                                    ? width * 0.5
                                    : largeLayout
                                        ? width * 0.4
                                        : width * 0.45,
                                height: tabLayout
                                    ? height * 0.28
                                    : largeLayout
                                        ? height * 0.15
                                        : height * 0.16,
                                // child: Image.asset(
                                //     _categoryItems[index]['image'])
                                child: Image.network(
                                    'http://192.168.0.154:3000${provider['data'][index]['main_image']}'),
                              ),
                            ),
                            SizedBox(height: height * 0.03),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.04),
                                  child: Text(provider['data'][index]['name'],
                                      // _categoryItems[index]['name'],
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 25
                                            : largeLayout
                                                ? 18
                                                : 16,
                                      )),
                                ),
                              ],
                            ),
                            // SizedBox(height: height * 0.01),
                            Container(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Row(
                                children: [
                                  Text('₹',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          fontSize: tabLayout
                                              ? 22
                                              : largeLayout
                                                  ? 18
                                                  : 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                      '${provider['data'][index]['price'].toString()}/${provider['data'][index]['uom']['short_name']}',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          fontSize: tabLayout
                                              ? 22
                                              : largeLayout
                                                  ? 18
                                                  : 16,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ],
                        ),
                        // !isClicked
                        // ?
                        Positioned(
                          top: tabLayout
                              ? height * 0.26
                              : largeLayout
                                  ? height * 0.165
                                  : height * 0.192,
                          right: width * 0.01,
                          child: Container(
                            width: tabLayout ? width * 0.09 : width * 0.1,
                            height: tabLayout
                                ? height * 0.1
                                : largeLayout
                                    ? height * 0.08
                                    : height * 0.1,
                            padding: EdgeInsets.only(top: height * 0.005),
                            decoration: const BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10))),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    SharedPreferences localStorage =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      provider['data'][index]
                                          ['selectedQuantity']++;
                                      // localStorage.setInt(
                                      //     'categoryCounter',
                                      //     provider['data'][index]
                                      //         ['selectedQuantity']++);
                                      print('Increased');
                                    });
                                  },
                                  child: Text('+',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: tabLayout
                                              ? 30
                                              : largeLayout
                                                  ? 18
                                                  : 12,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    provider['data'][index]['selectedQuantity']
                                        .toString(),
                                    // count.toString(),
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: tabLayout
                                            ? 30
                                            : largeLayout
                                                ? 18
                                                : 12,
                                        fontWeight: FontWeight.bold)),
                                InkWell(
                                  onTap: () async {
                                    SharedPreferences localStorage =
                                        await SharedPreferences.getInstance();
                                    setState(() {
                                      // while (count > 0) {
                                      //   count--;
                                      // }

                                      if (provider['data'][index]
                                              ['selectedQuantity'] >
                                          0) {
                                        // provider['data'][index]['qty']--;
                                        provider['data'][index]
                                            ['selectedQuantity']--;
                                        // localStorage.setInt(
                                        //     'categoryCounter',
                                        //     provider['data'][index]
                                        //         ['selectedQuantity']--);
                                      } else {
                                        // provider['data'][index]['qty'] =
                                        //     0;
                                        provider['data'][index]
                                            ['selectedQuantity'] = 0;
                                        // localStorage.setInt(
                                        //     'categoryCounter', 0);
                                      }

                                      print('Decreased');
                                    });
                                    // if (provider['data'][index]['qty'] ==
                                    //     0) {
                                    //   setState(() {
                                    // isClicked = false;
                                    //   });
                                    // }
                                  },
                                  child: Text('-',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: tabLayout
                                              ? 30
                                              : largeLayout
                                                  ? 18
                                                  : 12,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                        )
                        // : Positioned(
                        //     top: height * 0.2,
                        //     right: width * 0.01,
                        //     child: InkWell(
                        //       onTap: () {
                        //         setState(() {
                        //           // isClicked = true;
                        //           provider['data'][index]['qty']++;
                        //         });
                        //       },
                        //       child: Container(
                        //         width: width * 0.1,
                        //         height: height * 0.035,
                        //         decoration: const BoxDecoration(
                        //             color: Colors.green,
                        //             borderRadius: BorderRadius.only(
                        //                 topLeft: Radius.circular(10),
                        //                 topRight: Radius.circular(10))),
                        //         child: const Center(
                        //           child: Text('+',
                        //               // // textScaleFactor: textScaleFactor,
                        //               style: TextStyle(
                        //                   color: Colors.white,
                        //                   fontSize: 18,
                        //                   fontWeight: FontWeight.bold)),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                      ],
                    ),
                  ),
                  itemCount: provider['data'].length,
                ),
        ),
      ),
    );
  }
}
