import 'package:flutter/material.dart';

class TopSeller extends StatefulWidget {
  TopSellerState createState() => TopSellerState();
}

class TopSellerState extends State<TopSeller> {
  final List<dynamic> _popularDeals = [
    {
      'id': 1,
      'image': 'assets/images/wkhkz8ky.png',
      'name': 'Meat',
      'price': '₹250/kg'
    },
    {
      'id': 2,
      'image': 'assets/images/jmic18a2.png',
      'name': 'Vegetables',
      'price': '₹25/kg'
    },
    {
      'id': 3,
      'image': 'assets/images/jux6dfoh.png',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Top Sellers',
            textScaleFactor: textScaleFactor,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: height * 0.01),
          Container(
            width: width * 0.9,
            height: height * 0.28,
            margin: EdgeInsets.only(bottom: height * 0.04),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.1,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.005,
                        width * 0.02, height * 0.008),
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
          Container(
            width: width * 0.9,
            height: height * 0.28,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: height * 0.1,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.005,
                        width * 0.02, height * 0.008),
                    // margin: EdgeInsets.only(top: height * 0.01),
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
          )
        ],
      ),
    );
  }
}
