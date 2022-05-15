import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/popularDeals/popularDealsProducts.dart';

class PopularDeals extends StatefulWidget {
  PopularDealsState createState() => PopularDealsState();
}

class PopularDealsState extends State<PopularDeals> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDealsProvider>(context, listen: false)
        .getPopularDeals()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

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
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<PopularDealsProvider>(context).popularDeals;

    // TODO: implement build
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.green,
            ),
          )
        : Padding(
            padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
            child: Container(
              width: width * 0.9,
              height: tabLayout
                  ? height * 0.34
                  : largeLayout
                      ? height * 0.31
                      : height * 0.32,
              margin: EdgeInsets.only(bottom: height * 0.04),
              decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: width * 0.04,
                        top: height * 0.01,
                        right: width * 0.04),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Popular Deals',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 25
                                  : largeLayout
                                      ? 17
                                      : 12),
                        ),
                        Text(
                          'View All',
                          // // textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: tabLayout
                                  ? 18
                                  : largeLayout
                                      ? 14
                                      : 10),
                        )
                      ],
                    ),
                  ),
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
                          width: tabLayout ? width * 0.35 : width * 0.45,
                          height: double.infinity,
                          margin: EdgeInsets.only(right: width * 0.02),
                          // color: Colors.amber,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(30),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 10,
                                            offset: Offset(1, 2))
                                      ]),
                                  child: Image.network(
                                    'http://3.109.206.91:8000${provider['data'][index][0]['main_image']}',
                                    fit: BoxFit.contain,
                                    width: tabLayout
                                        ? width * 0.35
                                        : largeLayout
                                            ? width * 0.45
                                            : width * 0.3,
                                    height: tabLayout
                                        ? height * 0.24
                                        : height * 0.2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.03),
                                  child: Text(
                                    provider['data'][index][0]['name'],
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? width * 0.02
                                            : largeLayout
                                                ? 14
                                                : 12),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.03),
                                  child: Text(
                                      '₹${provider['data'][index][0]['price']}/${provider['data'][index][0]['uom']['short_name']}',
                                      // // textScaleFactor: textScaleFactor,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: tabLayout
                                              ? width * 0.02
                                              : largeLayout
                                                  ? 14
                                                  : 1)),
                                ),
                              ]),
                        ),
                        itemCount: provider['data'].length,
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }
}
