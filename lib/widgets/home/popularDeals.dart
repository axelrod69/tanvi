import 'package:flutter/material.dart';

class PopularDeals extends StatefulWidget {
  PopularDealsState createState() => PopularDealsState();
}

class PopularDealsState extends State<PopularDeals> {
  final List<dynamic> _popularDeals = [
    {
      'id': 1,
      'image': 'assets/images/Rectangle 256.png',
      'name': 'Tomato',
      'price': '₹25/kg'
    },
    {
      'id': 2,
      'image': 'assets/images/Rectangle 257.png',
      'name': 'Cabbage',
      'price': '₹25/kg'
    },
    {
      'id': 3,
      'image': 'assets/images/Rectangle 258.png',
      'name': 'Meat',
      'price': '₹200/kg'
    },
    {
      'id': 4,
      'image': 'assets/images/Rectangle 260.png',
      'name': 'Fruits',
      'price': '₹100/kg'
    },
    {
      'id': 5,
      'image': 'assets/images/Rectangle 259.png',
      'name': 'Cosmetics',
      'price': '₹100/kg'
    },
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
        height: height * 0.31,
        margin: EdgeInsets.only(bottom: height * 0.04),
        decoration: BoxDecoration(
            color: Colors.green[50],
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
                    'Popular Deals',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'View All',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.green, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                height: height * 0.1,
                padding: EdgeInsets.fromLTRB(
                    width * 0.02, height * 0.005, width * 0.02, height * 0.008),
                margin: EdgeInsets.only(top: height * 0.01),
                decoration: const BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Container(
                    width: width * 0.45,
                    height: double.infinity,
                    margin: EdgeInsets.only(right: width * 0.02),
                    // color: Colors.amber,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            _popularDeals[index]['image'],
                            fit: BoxFit.cover,
                            width: width * 0.45,
                            height: height * 0.2,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Text(
                              _popularDeals[index]['name'],
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: width * 0.03),
                            child: Text(_popularDeals[index]['price'],
                                textScaleFactor: textScaleFactor,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ]),
                  ),
                  itemCount: _popularDeals.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
