import 'package:flutter/material.dart';
import '../widgets/orders/currentOrders.dart';
import '../widgets/orders/allOrders.dart';

class PageViewScreenOrder extends StatefulWidget {
  PageViewScreenOrderState createState() => PageViewScreenOrderState();
}

class PageViewScreenOrderState extends State<PageViewScreenOrder>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
    tabController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final textScale = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: InkWell(
            onTap: () => Navigator.of(context).pushNamed('/landing-page'),
            child: const Icon(Icons.arrow_back_ios, color: Colors.green)),
        title: Padding(
          padding: EdgeInsets.only(left: width * 0.17),
          child: Text('My Orders',
              textScaleFactor: textScale,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold)),
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.green,
          tabs: const [
            // Tab(
            //   text: 'Cancelled Orders',
            // ),

            Tab(
              // text: 'Cooking',
              child: Text('Current Orders',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
            Tab(
              child: Text('All Orders',
                  style: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // CancelledOrders(),
          CurrentOrders(),
          AllOrders()
        ],
      ),
    );
  }
}
