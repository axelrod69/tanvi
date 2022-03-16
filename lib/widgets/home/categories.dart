import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  CategoriesState createState() => CategoriesState();
}

class CategoriesState extends State<Categories> {
  final List<dynamic> _categories = [
    {'id': 1, 'image': 'assets/images/Layer_3.png', 'name': 'Vegetables'},
    {'id': 2, 'image': 'assets/images/Layer_4.png', 'name': 'Fruits'},
    {'id': 3, 'image': 'assets/images/Layer_5.png', 'name': 'Meat'},
    {'id': 4, 'image': 'assets/images/Layer_6.png', 'name': 'Seafood'},
    {'id': 5, 'image': 'assets/images/Layer_7.png', 'name': 'Groceries'},
    {'id': 6, 'image': 'assets/images/Layer_3.png', 'name': 'Vegetables'},
    {'id': 7, 'image': 'assets/images/Layer_4.png', 'name': 'Fruits'},
    {'id': 8, 'image': 'assets/images/Layer_5.png', 'name': 'Meat'},
    {'id': 9, 'image': 'assets/images/Layer_6.png', 'name': 'Seafood'},
    {'id': 10, 'image': 'assets/images/Layer_7.png', 'name': 'Groceries'}
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: width * 0.9,
        height: height * 0.22,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
            ]),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  left: width * 0.04, top: height * 0.01, right: width * 0.04),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () =>
                        Navigator.of(context).pushNamed('/category-screen'),
                    child: Text(
                      'View All',
                      textScaleFactor: textScaleFactor,
                      style: const TextStyle(color: Colors.greenAccent),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                // height: height * 0.1,
                margin: EdgeInsets.only(top: height * 0.01),
                padding: EdgeInsets.only(
                    left: width * 0.02,
                    top: height * 0.005,
                    right: width * 0.02,
                    bottom: height * 0.008),
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: width * 0.3,
                    height: height * 0.06,
                    // padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.01,
                    //     width * 0.02, height * 0.01),
                    margin: EdgeInsets.only(right: width * 0.02),
                    padding: EdgeInsets.only(
                        left: width * 0.02, right: width * 0.02),
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          height: height * 0.12,
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Image.asset(
                            _categories[index]['image'],
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          _categories[index]['name'],
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  itemCount: _categories.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
