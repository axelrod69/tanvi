import 'package:flutter/material.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/discount.dart';
import '../widgets/home/popularDeals.dart';
import '../widgets/home/topSeller.dart';
import '../widgets/home/recentItems.dart';
import '../widgets/home/bottomNavigation.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        // backgroundColor: Colors.red,
        elevation: 0,
        toolbarHeight: 180,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              textScaleFactor: textScaleFactor,
              style:
                  TextStyle(color: Colors.grey.withOpacity(0.8), fontSize: 20),
            ),
            Container(
              width: double.infinity,
              height: height * 0.18,
              padding: EdgeInsets.only(bottom: height * 0.01),
              // color: Colors.amber,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eli Avon',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: 40),
                      ),
                      Container(
                        width: width * 0.4,
                        height: height * 0.06,
                        // color: Colors.pink,
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.green, size: 35),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: height * 0.0098),
                                  child: Text(
                                    'Estimated Time',
                                    textScaleFactor: textScaleFactor,
                                    style: const TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                  ),
                                ),
                                // SizedBox(height: height * 0.01),
                                Text(
                                  'Park Street',
                                  textScaleFactor: textScaleFactor,
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 12),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: width * 0.7,
                    height: height * 0.055,
                    margin:
                        EdgeInsets.only(top: height * 0.02, left: width * 0.02),
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
                              color: Colors.grey.withOpacity(0.6),
                              fontSize: 25),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          Categories(),
          SizedBox(height: height * 0.025),
          Discount(),
          SizedBox(height: height * 0.025),
          PopularDeals(),
          TopSeller(),
          SizedBox(height: height * 0.025),
          RecentItems(),
          SizedBox(height: height * 0.025),
          Container(
            width: double.infinity,
            height: height * 0.1,
            color: const Color.fromRGBO(251, 243, 231, 1),
            child: Center(
              child: Text(
                'Oops..Ran out of it',
                textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
          ),
          SizedBox(height: height * 0.025),
        ],
      ),
      // bottomNavigationBar: BottomNavigation(),
    );
  }
}
