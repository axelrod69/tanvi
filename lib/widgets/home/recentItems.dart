import 'package:flutter/material.dart';

class RecentItems extends StatefulWidget {
  RecentItemsState createState() => RecentItemsState();
}

class RecentItemsState extends State<RecentItems> {
  final List<dynamic> _recentItems = [
    {
      'id': 1,
      'image': 'assets/images/coffee.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 2,
      'image': 'assets/images/PngItem_2867603.png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 3,
      'image': 'assets/images/pngegg(3).png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
    {
      'id': 4,
      'image': 'assets/images/pngegg(4).png',
      'name': 'Nestle Coffee',
      'category': 'Beverage',
      'price': '₹60'
    },
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: Container(
        width: double.infinity,
        // height: height * 0.7,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Recent Items',
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
            SizedBox(height: height * 0.04),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Padding(
                padding:
                    EdgeInsets.only(left: width * 0.02, right: width * 0.02),
                child: Container(
                  width: double.infinity,
                  height: tabLayout
                      ? height * 0.14
                      : largeLayout
                          ? height * 0.1
                          : height * 0.12,
                  padding: EdgeInsets.fromLTRB(width * 0.01, height * 0.005,
                      width * 0.02, height * 0.005),
                  margin: EdgeInsets.only(bottom: height * 0.04),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5,
                            offset: Offset(0, 2))
                      ]),
                  child: Row(
                    children: [
                      Container(
                        height: double.infinity,
                        width: width * 0.2,
                        decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: BorderRadius.circular(15)),
                        child: Image.asset(_recentItems[index]['image']),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: width * 0.04),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _recentItems[index]['name'],
                              // // textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            SizedBox(height: height * 0.01),
                            Text(
                              _recentItems[index]['category'],
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: width * 0.15),
                      Text(
                        _recentItems[index]['price'],
                        // // textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                ),
              ),
              itemCount: _recentItems.length,
            )
          ],
        ),
      ),
    );
  }
}
