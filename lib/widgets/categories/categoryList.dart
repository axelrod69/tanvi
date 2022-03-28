import 'package:flutter/material.dart';

class CategoryList extends StatefulWidget {
  CategoryListState createState() => CategoryListState();
}

class CategoryListState extends State<CategoryList> {
  // int count = 0;
  bool isClicked = false;
  final List<dynamic> _categoryItems = [
    {
      'id': 1,
      'name': 'Tomatoes (1KG)',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/tomato-15559.png'
    },
    {
      'id': 2,
      'name': 'Cabbage (1KG)',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/PngItem_1310699.png'
    },
    {
      'id': 3,
      'name': 'Onions (1KG)',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/tomato-15559.png'
    },
    {
      'id': 4,
      'name': 'Turnip (1KG)',
      'discountPrice': '30.00/kg',
      'actualPrice': '30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 0,
      'image': 'assets/images/PngItem_1310699.png'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
        toolbarHeight: 55,
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
              padding: EdgeInsets.only(left: width * 0.24),
              child: Text(
                'Vegetables',
                textScaleFactor: textScaleFactor,
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
          child: GridView.builder(
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
                        onTap: () => Navigator.of(context)
                            .pushNamed('/item-details', arguments: {
                          'image': _categoryItems[index]['image'],
                          'name': _categoryItems[index]['name'],
                          'quantity': _categoryItems[index]['quantity'],
                          'description': _categoryItems[index]['decription'],
                          'price': _categoryItems[index]['discountPrice']
                        }),
                        child: Container(
                            width: width * 0.4,
                            height: height * 0.15,
                            child: Image.asset(_categoryItems[index]['image'])),
                      ),
                      SizedBox(height: height * 0.01),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.04),
                            child: Text(_categoryItems[index]['name'],
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Row(
                          children: [
                            Text('₹',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey,
                                )),
                            SizedBox(width: width * 0.01),
                            Text(_categoryItems[index]['discountPrice'],
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                  // fontSize: 12,
                                  color: Colors.grey,
                                ))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: width * 0.04),
                        child: Row(
                          children: [
                            Text('₹',
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                            SizedBox(width: width * 0.01),
                            Text(_categoryItems[index]['actualPrice'],
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                    // fontSize: 15,
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
                                      _categoryItems[index]['quantity']++;
                                    });
                                  },
                                  child: Text('+',
                                      textScaleFactor: textScaleFactor,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                    _categoryItems[index]['quantity']
                                        .toString(),
                                    // count.toString(),
                                    textScaleFactor: textScaleFactor,
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold)),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      // while (count > 0) {
                                      //   count--;
                                      // }

                                      if (_categoryItems[index]['quantity'] !=
                                          0) {
                                        _categoryItems[index]['quantity']--;
                                      } else {
                                        _categoryItems[index]['quantity'] = 0;
                                      }
                                    });
                                    // if (_categoryItems[index]['quantity'] ==
                                    //     0) {
                                    //   setState(() {
                                    //     // isClicked = false;
                                    //   });
                                    // }
                                  },
                                  child: Text('-',
                                      textScaleFactor: textScaleFactor,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
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
                                _categoryItems[index]['quantity']++;
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
                              child: Center(
                                child: Text('+',
                                    textScaleFactor: textScaleFactor,
                                    style: const TextStyle(
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
            itemCount: _categoryItems.length,
          ),
        ),
      ),
    );
  }
}
