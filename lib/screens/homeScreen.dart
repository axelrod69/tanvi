import 'package:flutter/material.dart';
import 'package:tanvi/widgets/bottomNavigation.dart';
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
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: Color.fromRGBO(236, 236, 248, 1),
        // foregroundColor: Color.fromRGBO(236, 236, 248, 1),
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
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Categories(),
            ),
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
            SizedBox(height: height * 0.15),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigation(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
      // floatingActionButton: Container(
      //   height: height * 0.15,
      //   width: double.infinity,
      //   // color: Colors.red,
      //   // padding: EdgeInsets.only(
      //   //   left: width * 0.15, top: height * 0.08,
      //   //   //  right: width * 0.04
      //   // ),
      //   padding: EdgeInsets.only(top: height * 0.035),
      //   child: Stack(
      //     children: [
      //       Center(
      //         child: Container(
      //           width: width * 0.85,
      //           height: height * 0.06,
      //           decoration: const BoxDecoration(
      //               color: Colors.white,
      //               borderRadius: BorderRadius.only(
      //                   bottomLeft: Radius.circular(20),
      //                   bottomRight: Radius.circular(20)),
      //               boxShadow: [
      //                 BoxShadow(
      //                     color: Colors.grey,
      //                     blurRadius: 5,
      //                     offset: Offset(0, 2))
      //               ]),
      //           child: Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Container(
      //                 height: double.infinity,
      //                 width: width * 0.35,
      //                 padding: EdgeInsets.only(left: width * 0.02),
      //                 // color: Colors.red,
      //                 child: Row(
      //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                   children: [
      //                     InkWell(
      //                       onTap: () {},
      //                       child: Image.asset(
      //                           'assets/images/Icon awesome-shopping-cart.png'),
      //                     ),
      //                     SizedBox(width: width * 0.1),
      //                     InkWell(
      //                       onTap: () {},
      //                       child: Image.asset(
      //                           'assets/images/Icon ionic-ios-settings.png'),
      //                     )
      //                   ],
      //                 ),
      //               ),
      //               Container(
      //                 height: double.infinity,
      //                 width: width * 0.35,
      //                 // padding: EdgeInsets.only(right: width * 0.02),
      //                 // color: Colors.blue,
      //                 child: Row(
      //                   children: [
      //                     Padding(
      //                       padding: EdgeInsets.only(left: width * 0.05),
      //                       child: InkWell(
      //                         onTap: () {},
      //                         child: Image.asset(
      //                             'assets/images/Icon awesome-bell.png'),
      //                       ),
      //                     ),
      //                     SizedBox(width: width * 0.1),
      //                     InkWell(
      //                         onTap: () {},
      //                         child: Image.asset('assets/images/rkwxkca7.png'))
      //                   ],
      //                 ),
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       Positioned(
      //         child: InkWell(
      //           onTap: () {},
      //           child: Container(
      //             height: height * 0.075,
      //             decoration: BoxDecoration(
      //                 color: Colors.white,
      //                 shape: BoxShape.circle,
      //                 boxShadow: const [
      //                   BoxShadow(
      //                       color: Colors.grey,
      //                       blurRadius: 5,
      //                       offset: Offset(0, 2))
      //                 ],
      //                 border: Border.all(
      //                     color: Colors.green,
      //                     width: 2,
      //                     style: BorderStyle.solid)),
      //             child: Center(
      //                 child:
      //                     Image.asset('assets/images/Icon ionic-ios-home.png')),
      //           ),
      //         ),
      //       )
      //     ],
      //   ),
      // ),

      // bottomNavigationBar: Container(
      //   width: width * 0.7,
      //   height: height * 0.07,
      //   margin: EdgeInsets.only(
      //       left: width * 0.04, right: width * 0.04, bottom: height * 0.04),
      //   decoration: const BoxDecoration(color: Colors.white, boxShadow: [
      //     BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
      //   ]),
      // ),
    );
  }
}
