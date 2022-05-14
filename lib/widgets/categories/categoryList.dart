import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/categoryProducts/categoryProductsProvider.dart';

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
  String baseUrl = 'http://3.109.206.91:8000';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider =
        Provider.of<CategoryProductsProvider>(context).categoryProducts;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
        toolbarHeight: 55,
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: height * 0.05,
                width: width * 0.1,
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
                    child:
                        const Icon(Icons.arrow_back_ios, color: Colors.green),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.12),
              child: Text(
                widget.categoryName,
                // // textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
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
                                  'quantity': count,
                                  'description': provider['data'][index]
                                      ['description'],
                                  'price': provider['data'][index]['price']
                                });
                                // print(
                                //     'Quantity Print ${_categoryItems[index]['quantity']}');
                              },
                              child: Container(
                                width: width * 0.4,
                                height: height * 0.15,
                                // child: Image.asset(
                                //     _categoryItems[index]['image'])
                                child: Image.network(
                                    'http://3.109.206.91:8000${provider['data'][index]['main_image']}'),
                              ),
                            ),
                            SizedBox(height: height * 0.01),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.04),
                                  child: Text(provider['data'][index]['name'],
                                      // _categoryItems[index]['name'],
                                      // // textScaleFactor: textScaleFactor,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(height: height * 0.01),
                            Container(
                              padding: EdgeInsets.only(left: width * 0.04),
                              child: Row(
                                children: [
                                  const Text('₹',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(width: width * 0.01),
                                  Text(
                                      '${provider['data'][index]['price'].toString()}/${provider['data'][index]['uom']['short_name']}',
                                      // // textScaleFactor: textScaleFactor,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            ),
                          ],
                        ),
                        !isClicked
                            ? Positioned(
                                top: height * 0.152,
                                right: width * 0.01,
                                child: Container(
                                  width: width * 0.1,
                                  height: height * 0.08,
                                  padding: EdgeInsets.only(top: height * 0.005),
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            count =
                                                provider['data'][index]['qty'];
                                            count++;
                                          });
                                        },
                                        child: const Text('+',
                                            // // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Text(count.toString(),
                                          // count.toString(),
                                          // // textScaleFactor: textScaleFactor,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            // while (count > 0) {
                                            //   count--;
                                            // }

                                            if (provider['data'][index]
                                                    ['qty'] !=
                                                0) {
                                              // provider['data'][index]['qty']--;
                                              count--;
                                            } else {
                                              // provider['data'][index]['qty'] =
                                              //     0;
                                              count = 0;
                                            }
                                          });
                                          // if (provider['data'][index]['qty'] ==
                                          //     0) {
                                          //   setState(() {
                                          // isClicked = false;
                                          //   });
                                          // }
                                        },
                                        child: const Text('-',
                                            // // textScaleFactor: textScaleFactor,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            : Positioned(
                                top: height * 0.2,
                                right: width * 0.01,
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // isClicked = true;
                                      provider['data'][index]['qty']++;
                                    });
                                  },
                                  child: Container(
                                    width: width * 0.1,
                                    height: height * 0.035,
                                    decoration: const BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10))),
                                    child: const Center(
                                      child: Text('+',
                                          // // textScaleFactor: textScaleFactor,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                ),
                              ),
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
