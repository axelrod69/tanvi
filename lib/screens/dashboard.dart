import 'package:flutter/material.dart';
import '../widgets/dashboard/graph.dart';
import '../widgets/dashboard/orderHistory.dart';
import '../widgets/dashboard/paymentMethod.dart';
import '../widgets/dashboard/frequent.dart';
import '../widgets/dashboard/referFriend.dart';
import '../widgets/dashboard/notification.dart';
import '../widgets/dashboard/reviewAndRating.dart';
import '../widgets/bottomNavigation.dart';

class Dashboard extends StatefulWidget {
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          'My Dashboard',
          textScaleFactor: textScaleFactor,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
            Container(
              margin: EdgeInsets.only(top: height * 0.02),
              child: Row(
                children: [
                  Container(
                    width: width * 0.32,
                    height: height * 0.15,
                    padding: EdgeInsets.only(
                        top: height * 0.002,
                        right: width * 0.005,
                        bottom: height * 0.002),
                    decoration: const BoxDecoration(
                        color: Colors.greenAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.green,
                              blurRadius: 2,
                              offset: Offset(0, 2))
                        ],
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Container(
                      width: width * 0.3,
                      height: 0.15,
                      padding: EdgeInsets.only(
                          left: width * 0.06,
                          top: height * 0.001,
                          bottom: height * 0.001),
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(236, 236, 248, 1),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: Image.asset(
                        'assets/images/egpa9l0l.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    height: height * 0.15,
                    // color: Colors.red,
                    padding:
                        EdgeInsets.only(left: width * 0.04, top: height * 0.01),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Eli Avon',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                            const Icon(Icons.edit, color: Colors.black)
                          ],
                        ),
                        Text(
                          'somewhere@somewhat.com',
                          textScaleFactor: textScaleFactor,
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ))
                ],
              ),
            ),
            SizedBox(height: height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding:
                      EdgeInsets.only(left: width * 0.04, right: width * 0.04),
                  child: Container(
                    height: height * 0.06,
                    padding: EdgeInsets.only(left: width * 0.02),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.green,
                              blurRadius: 10,
                              offset: Offset(0, 2))
                        ]),
                    child: Row(
                      children: [
                        const Icon(Icons.location_pin,
                            color: Colors.green, size: 30),
                        Text(
                          '48, Tarun Sengupta Sarani',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 15),
                        ),
                        SizedBox(width: width * 0.15),
                        Text(
                          'Change',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ))
              ],
            ),
            SizedBox(height: height * 0.04),
            Padding(
              padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
              child: Graph(),
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Container(
                  height: height * 0.4,
                  width: width * 0.6,
                  // padding: EdgeInsets.symmetric(
                  //     vertical: height * 0.02, horizontal: width * 0.02),
                  padding: EdgeInsets.only(
                      left: width * 0.02,
                      top: height * 0.02,
                      bottom: height * 0.02),
                  // color: Colors.red,
                  child: OrderHistory(),
                ),
                Container(
                  height: height * 0.3,
                  width: width * 0.4,
                  // color: Colors.pink,
                  padding: EdgeInsets.symmetric(
                      vertical: height * 0.02, horizontal: width * 0.02),
                  child: PaymentMethod(),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: height * 0.25,
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.01,
                  right: width * 0.02,
                  bottom: height * 0.01),
              // color: Colors.red,
              child: Frequent(),
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: Container(
                    height: height * 0.28,
                    // color: Colors.red,
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.01,
                        right: width * 0.02,
                        bottom: height * 0.01),
                    child: ReferFriend(),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    height: height * 0.28,
                    // color: Colors.blue,
                    padding: EdgeInsets.only(
                        left: width * 0.02,
                        top: height * 0.01,
                        right: width * 0.02,
                        bottom: height * 0.01),
                    child: DashboardNotification(),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: width * 1,
              height: height * 0.33,
              // color: Colors.red,
              padding: EdgeInsets.only(
                  left: width * 0.02,
                  top: height * 0.01,
                  right: width * 0.02,
                  bottom: height * 0.01),
              child: ReviewAndRating(),
            ),
            SizedBox(height: height * 0.2)
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }
}
