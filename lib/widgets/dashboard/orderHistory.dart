import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/orderHistory/orderHistory.dart';

class OrderHistory extends StatefulWidget {
  OrderHistoryState createState() => OrderHistoryState();
}

class OrderHistoryState extends State<OrderHistory> {
  bool isLoading = true;

  final List<dynamic> _orderHistory = [
    {
      'id': 1,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'Delivered'
    },
    {
      'id': 2,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'On The Way'
    },
    {
      'id': 3,
      'name': 'The Super Store',
      'quantity': 10,
      'image': 'assets/images/kindpng_1606870.png',
      'status': 'Cancelled'
    }
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<OrderHistoryProvider>(context, listen: false)
        .getOrderHistory()
        .then((_) {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Container(
      width: width * 1,
      height: height * 1,
      decoration: BoxDecoration(
          image: const DecorationImage(
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
                padding:
                    EdgeInsets.only(left: width * 0.02, top: height * 0.01),
                child: Text(
                  'Order History',
                  // // textScaleFactor: textScaleFactor,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: tabLayout
                          ? 25
                          : largeLayout
                              ? 18
                              : 12),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(right: width * 0.02, top: height * 0.01),
                child: InkWell(
                  onTap: () => Navigator.of(context).pushNamed('/order-screen'),
                  child: Text(
                    'View All',
                    // // textScaleFactor: textScaleFactor,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: tabLayout
                            ? 16
                            : largeLayout
                                ? 12
                                : 10),
                  ),
                ),
              )
            ],
          ),
          // SizedBox(height: height * 0.02),
          Expanded(
              child: Container(
            width: double.infinity,
            // color: Colors.amber,
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(
                width: double.infinity,
                height: tabLayout
                    ? height * 0.14
                    : largeLayout
                        ? height * 0.1
                        : height * 0.155,
                margin: EdgeInsets.only(bottom: height * 0.005),
                // color: Colors.blue,
                child: Row(
                  children: [
                    Flexible(
                      flex: !tabLayout && !largeLayout ? 2 : 1,
                      child: Container(
                        height: double.infinity,
                        // color: Colors.pink,
                        padding: EdgeInsets.symmetric(
                            vertical: height * 0.01, horizontal: width * 0.01),
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            padding: EdgeInsets.symmetric(
                                vertical: height * 0.01,
                                horizontal: width * 0.01),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.green, width: 2),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 2))
                                ]),
                            child: Image.asset(
                              _orderHistory[index]['image'],
                              // fit: BoxFit.cover,
                            )),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        height: double.infinity,
                        // color: Colors.purple,
                        padding: EdgeInsets.only(top: height * 0.01),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _orderHistory[index]['name'],
                              // // textScaleFactor: textScaleFactor,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 25
                                      : largeLayout
                                          ? 16
                                          : 12),
                            ),
                            Text(
                              'No. of Item = ${_orderHistory[index]['quantity'].toString()}',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 20
                                      : largeLayout
                                          ? 12
                                          : 10),
                            ),
                            Text(
                              _orderHistory[index]['status'],
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: _orderHistory[index]['status'] ==
                                          'Delivered'
                                      ? Colors.green
                                      : _orderHistory[index]['status'] ==
                                              'On The Way'
                                          ? Colors.amber
                                          : Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 20
                                      : largeLayout
                                          ? 16
                                          : 12),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              itemCount: 3,
            ),
          ))
        ],
      ),
    );
  }
}
