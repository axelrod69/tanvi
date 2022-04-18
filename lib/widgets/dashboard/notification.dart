import 'package:flutter/material.dart';

class DashboardNotification extends StatefulWidget {
  DashboardNotificationState createState() => DashboardNotificationState();
}

class DashboardNotificationState extends State<DashboardNotification> {
  final List<dynamic> _notification = [
    {'name': 'Your bag is out for delivery', 'time': 'Now'},
    {'name': 'Your order has been delivered', 'time': '1h ago'},
    {'name': 'Your bag is out for delivery', 'time': '1d ago'},
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    // final textScaleFactorTwo = MediaQuery.of(context).textScaleFactor * 1.4;

    // TODO: implement build
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.only(top: height * 0.01),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/Rectangle 392.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: width * 0.02),
                child: Text(
                  'Notification',
                  // // textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: width * 0.02),
                child: Text(
                  'View All',
                  // // textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                ),
              )
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              // color: Colors.amber,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => Container(
                  width: double.infinity,
                  height: height * 0.06,
                  // color: Colors.green,
                  margin: EdgeInsets.only(bottom: height * 0.01),
                  child: Row(
                    children: [
                      Image.asset('assets/images/Icon simple-clockify.png'),
                      Container(
                        padding: EdgeInsets.only(top: height * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _notification[index]['name'],
                              overflow: TextOverflow.fade,
                              // textScaleFactor: textScaleFactorTwo,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 8),
                            ),
                            Text(
                              _notification[index]['time'],
                              // // textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                itemCount: _notification.length,
              ),
            ),
          )
        ],
      ),
    );
  }
}
