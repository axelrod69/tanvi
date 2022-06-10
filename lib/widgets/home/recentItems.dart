import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../model/orderHistory/orderHistory.dart';
import '../../screens/pendingOrdersPage.dart';

class RecentItems extends StatefulWidget {
  RecentItemsState createState() => RecentItemsState();
}

class RecentItemsState extends State<RecentItems> {
  bool isLoading = true;

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
    final provider = Provider.of<OrderHistoryProvider>(context).orderHistory;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
      child: isLoading
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : Container(
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
                      InkWell(
                        onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) => PendingOrders())),
                        child: Text(
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: height * 0.04),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02, right: width * 0.02),
                      child: Container(
                        width: double.infinity,
                        height: tabLayout
                            ? height * 0.14
                            : largeLayout
                                ? height * 0.1
                                : height * 0.12,
                        padding: EdgeInsets.fromLTRB(width * 0.01,
                            height * 0.005, width * 0.02, height * 0.005),
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
                              child: Image.network(
                                  provider[index]['product']['main_image']),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: width * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    provider[index]['product']['name'],
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
                                  SizedBox(height: height * 0.01),
                                  Text(
                                    provider[index]['order']['order_number'],
                                    // // textScaleFactor: textScaleFactor,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontWeight: FontWeight.bold,
                                        fontSize: tabLayout
                                            ? 22
                                            : largeLayout
                                                ? 15
                                                : 10),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                                width: tabLayout
                                    ? width * 0.3
                                    : largeLayout
                                        ? width * 0.1
                                        : width * 0.25),
                            Text(
                              '₹${provider[index]['product']['price']}',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout
                                      ? 50
                                      : largeLayout
                                          ? 17
                                          : 12),
                            )
                          ],
                        ),
                      ),
                    ),
                    itemCount: provider.length > 3 ? 3 : provider.length,
                  )
                ],
              ),
            ),
    );
  }
}
