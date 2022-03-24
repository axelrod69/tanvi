import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  CategoryScreenState createState() => CategoryScreenState();
}

class CategoryScreenState extends State<CategoryScreen> {
  final List<dynamic> _categoryImages = [
    {'image': 'assets/images/Layer_3.png', 'name': 'Vegetables'},
    {'image': 'assets/images/Layer_4.png', 'name': 'Fruits'},
    {'image': 'assets/images/Layer_5.png', 'name': 'Meat'},
    {'image': 'assets/images/Layer_6.png', 'name': 'Milk &Eggs'},
    {'image': 'assets/images/Layer_7.png', 'name': 'Fish'},
    {'image': 'assets/images/Layer_3.png', 'name': 'Drinks'},
    {'image': 'assets/images/Layer_4.png', 'name': 'Sea Food'},
    {'image': 'assets/images/Layer_5.png', 'name': 'Cake'},
    {'image': 'assets/images/Layer_6.png', 'name': 'Bakery'},
    {'image': 'assets/images/Layer_7.png', 'name': 'Biscuits'},
    {'image': 'assets/images/Layer_3.png', 'name': 'Ice Cream'},
    {'image': 'assets/images/Layer_4.png', 'name': 'Juice'}
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
        centerTitle: true,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
        toolbarHeight: 120,
        title: Column(
          children: [
            Row(
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
                        child: const Icon(Icons.arrow_back_ios,
                            color: Colors.green),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: width * 0.22),
                  child: Text(
                    'Categories',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
            Container(
              width: width * 0.65,
              height: height * 0.055,
              margin: EdgeInsets.only(
                // left: width * 0.05,
                top: height * 0.02,
                // right: width * 0.05,
              ),
              padding: EdgeInsets.only(left: width * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.greenAccent,
                        // spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 2))
                  ]),
              child: Row(
                children: [
                  const Icon(
                    Icons.search_outlined,
                    color: Colors.grey,
                    size: 30,
                  ),
                  SizedBox(width: width * 0.04),
                  Text(
                    'Search',
                    textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6), fontSize: 25),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: GridView.builder(
          // physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: width * 0.04,
              crossAxisSpacing: height * 0.04),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).pushNamed('/category-list'),
            child: Container(
              // width: width * 0.3,
              // height: height * 0.3,
              margin: EdgeInsets.only(
                  left: width * 0.01,
                  top: height * 0.02,
                  right: width * 0.01,
                  bottom: height * 0.01),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(239, 239, 232, 1),
                  borderRadius: BorderRadius.circular(20),
                  // borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(20), topRight: Radius.circular(20)),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
                      child: Image.asset(
                        _categoryImages[index]['image'],
                        // fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  // SizedBox(height: height * 0.04),
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.green[50],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.greenAccent,
                                blurRadius: 5,
                                offset: Offset(0, 2))
                          ]),
                      child: Center(
                        child: Text(
                          _categoryImages[index]['name'],
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  )
                  // Image.asset(_categoryImages[index]['image']),
                  // SizedBox(height: height * 0.04),
                  // Text(
                  //   _categoryImages[index]['name'],
                  //   textScaleFactor: textScaleFactor,
                  //   style: const TextStyle(
                  //       color: Colors.black, fontWeight: FontWeight.bold),
                  // )
                ],
              ),
            ),
          ),
          itemCount: _categoryImages.length,
        ),
      ),
    );
  }
}
