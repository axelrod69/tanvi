import 'package:flutter/material.dart';
import '../widgets/home/categories.dart';
import '../widgets/home/discount.dart';
import '../widgets/home/popularDeals.dart';
import '../widgets/home/topSeller.dart';
import '../widgets/home/recentItems.dart';
import '../model/location/location.dart';
import 'package:provider/provider.dart';
import '../screens/wishListScreen.dart';
import '../model/profile/profileProvider.dart';

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final provider = Provider.of<LocationProvider>(context).address;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;

    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
        // foregroundColor: Color.fromRGBO(236, 236, 248, 1),
        // backgroundColor: Colors.red,
        elevation: 0,
        toolbarHeight: height * 0.22,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome',
              // textScaleFactor: textScaleFactor,
              style: TextStyle(
                  color: Colors.grey.withOpacity(0.8),
                  fontSize: tabLayout
                      ? 30
                      : largeLayout
                          ? 25
                          : 15),
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
                        '${profileProvider['data']['first_name']}',
                        // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            // fontWeight: FontWeight.bold,
                            fontSize: tabLayout
                                ? 50
                                : largeLayout
                                    ? 35
                                    : 25),
                      ),
                      Container(
                        width: width * 0.4,
                        height: height * 0.06,
                        // color: Colors.pink,
                        child: Row(
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.green,
                                size: !tabLayout && !largeLayout
                                    ? width * 0.05
                                    : 35),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: height * 0.0098),
                                  child: Text(
                                    'Estimated Time',
                                    // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: tabLayout
                                            ? 18
                                            : largeLayout
                                                ? 15
                                                : 10),
                                  ),
                                ),
                                // SizedBox(height: height * 0.01),
                                Text(
                                  provider,
                                  // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: tabLayout
                                          ? 18
                                          : largeLayout
                                              ? 15
                                              : 10),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Center(
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/search-screen'),
                      child: Container(
                        width: width * 0.8,
                        height: !tabLayout && !largeLayout
                            ? height * 0.075
                            : height * 0.055,
                        margin: EdgeInsets.only(
                          top: height * 0.02,
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
                            Icon(
                              Icons.search_outlined,
                              color: Colors.grey,
                              size: !tabLayout && !largeLayout ? 22 : 30,
                            ),
                            SizedBox(width: width * 0.04),
                            Text(
                              'Search',
                              // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.grey.withOpacity(0.6),
                                  fontSize: tabLayout
                                      ? width * 0.03
                                      : largeLayout
                                          ? 25
                                          : 18),
                            )
                          ],
                        ),
                      ),
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
            WishListScreen(),
            SizedBox(height: height * 0.025),
            RecentItems(),
            SizedBox(height: height * 0.025),
            // Container(
            //   width: double.infinity,
            //   height: height * 0.1,
            //   color: const Color.fromRGBO(251, 243, 231, 1),
            //   child: Center(
            //     child: Text(
            //       'Oops..Ran out of it',
            //       // textScaleFactor: textScaleFactor,
            //       style: TextStyle(
            //           color: Colors.grey[600],
            //           fontWeight: FontWeight.bold,
            //           fontSize: 20),
            //     ),
            //   ),
            // ),
            // SizedBox(height: height * 0.05),
          ],
        ),
      ),
      // bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}
