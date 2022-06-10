import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/orderHistory/orderHistory.dart';

class PendingOrders extends StatefulWidget {
  PendingOrdersState createState() => PendingOrdersState();
}

class PendingOrdersState extends State<PendingOrders> {
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
    final provider = Provider.of<OrderHistoryProvider>(context).pendingHistory;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromRGBO(236, 236, 248, 1),
        toolbarHeight: tabLayout
            ? 100
            : largeLayout
                ? 55
                : 60,
        centerTitle: true,
        title: Row(
          children: [
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                height: tabLayout
                    ? height * 0.07
                    : largeLayout
                        ? height * 0.05
                        : height * 0.08,
                width: !tabLayout && !largeLayout ? width * 0.12 : width * 0.1,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Icon(Icons.arrow_back_ios,
                        size: tabLayout
                            ? 40
                            : largeLayout
                                ? 14
                                : 18,
                        color: Colors.green),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: tabLayout
                      ? width * 0.32
                      : largeLayout
                          ? width * 0.24
                          : width * 0.2),
              child: Text(
                'Recent Items',
                // // textScaleFactor: textScaleFactor,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: tabLayout
                        ? 35
                        : largeLayout
                            ? 18
                            : 14),
              ),
            )
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        // child: ListView.builder(
        //   itemBuilder: (context, index) => ,
        //   itemCount: ,
        // ),
      ),
    );
  }
}
