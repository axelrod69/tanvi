import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/orderHistory/orderHistory.dart';
import 'package:intl/intl.dart';

class PendingOrders extends StatefulWidget {
  PendingOrdersState createState() => PendingOrdersState();
}

class PendingOrdersState extends State<PendingOrders> {
  bool isLoading = true;

  DateFormat dateFormat = DateFormat('dd-MMM-yyyy HH:mm:ss');

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
                  width:
                      !tabLayout && !largeLayout ? width * 0.12 : width * 0.1,
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
        body: Padding(
          padding: EdgeInsets.only(left: width * 0.04, right: width * 0.04),
          child: isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                )
              : Container(
                  width: double.infinity,
                  height: double.infinity,
                  // height: height * 0.7,
                  // color: Colors.red,
                  child: ListView.builder(
                    shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(
                          left: width * 0.02,
                          top: height * 0.02,
                          right: width * 0.02),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: tabLayout
                                ? height * 0.14
                                : largeLayout
                                    ? height * 0.1
                                    : height * 0.12,
                            padding: EdgeInsets.fromLTRB(width * 0.01,
                                height * 0.005, width * 0.02, height * 0.005),
                            margin: provider['data'][index]['order_details']
                                        ['isExpanded'] ==
                                    true
                                ? const EdgeInsets.only(bottom: 0)
                                : EdgeInsets.only(bottom: height * 0.04),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: provider['data'][index]
                                            ['order_details']['isExpanded'] ==
                                        true
                                    ? const BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))
                                    : BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 5,
                                      offset: Offset(0, 2))
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Container(
                                //   height: double.infinity,
                                //   width: width * 0.2,
                                //   decoration: BoxDecoration(
                                //       color: Colors.green[100],
                                //       borderRadius: BorderRadius.circular(15)),
                                //   child: Image.network(
                                //       provider[index]['product']['main_image']),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.02),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        provider['data'][index]['order_details']
                                            ['order_number'],
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 23
                                                : largeLayout
                                                    ? 15
                                                    : 10),
                                      ),
                                      SizedBox(height: height * 0.01),
                                      Text(
                                        // provider['data'][index]['order_details']
                                        //     ['created_at'],sss
                                        '${dateFormat.format(DateTime.parse(provider['data'][index]['order_details']['created_at']).toLocal())}',
                                        // // textScaleFactor: textScaleFactor,
                                        style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                            fontSize: tabLayout
                                                ? 18
                                                : largeLayout
                                                    ? 8
                                                    : 8),
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
                                Row(
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        '₹${provider['data'][index]['order_details']['grand_total']}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                        // // textScaleFactor: textScaleFactor,
                                        // textScaleFactor:
                                        //     MediaQuery.of(context).textScaleFactor *
                                        //         1.2,
                                        // style: TextStyle(
                                        //     color: Colors.black,
                                        //     fontWeight: FontWeight.bold,
                                        //     fontSize: tabLayout
                                        //         ? 50
                                        //         : largeLayout
                                        //             ? 17
                                        //             : 12),
                                      ),
                                    ),
                                    InkWell(
                                        onTap: () {
                                          print(
                                              'length: ${provider['data'][index]['order_products'].length}');
                                          print(
                                              'isExpanded: ${provider['data'][index]['order_details']['isExpanded']}');
                                          setState(() {
                                            provider['data'][index]
                                                        ['order_details']
                                                    ['isExpanded'] =
                                                !provider['data'][index]
                                                        ['order_details']
                                                    ['isExpanded'];
                                          });
                                        },
                                        child: Icon(!provider['data'][index]
                                                ['order_details']['isExpanded']
                                            ? Icons.arrow_drop_down
                                            : Icons.arrow_drop_up))
                                  ],
                                )
                              ],
                            ),
                          ),
                          if (provider['data'][index]['order_details']
                                  ['isExpanded'] ==
                              true)
                            Container(
                              width: double.infinity,
                              margin: EdgeInsets.only(bottom: height * 0.04),
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20),
                                      bottomRight: Radius.circular(20)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5,
                                        offset: Offset(0, 2))
                                  ]),
                              child: Container(
                                  width: double.infinity,
                                  height: height * 0.18,
                                  padding: const EdgeInsets.all(5),
                                  // color: Colors.red,
                                  child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      // provider['data'][index]['order_products']
                                      children: [
                                        for (int itemIndex = 0;
                                            itemIndex <
                                                provider['data'][index]
                                                        ['order_products']
                                                    .length;
                                            itemIndex++)
                                          Column(
                                            children: [
                                              Container(
                                                width: width * 0.25,
                                                height: height * 0.1,
                                                // color: Colors.red,
                                                margin: EdgeInsets.only(
                                                    bottom: height * 0.01,
                                                    right: width * 0.02),
                                                decoration: BoxDecoration(
                                                    color: Colors.green,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Colors.green,
                                                        width: 2,
                                                        style:
                                                            BorderStyle.solid),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 8,
                                                          offset: Offset(1, 2))
                                                    ]),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  child: Image.network(
                                                    'http://34.100.212.22${provider['data'][index]['order_products'][itemIndex]['product']['main_image']}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(width: width * 0.03),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    '${provider['data'][index]['order_products'][itemIndex]['product']['name']} ${provider['data'][index]['order_products'][itemIndex]['product']['weight']}${provider['data'][index]['order_products'][itemIndex]['product']['uom']['short_name']}',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16),
                                                  ),
                                                  Text(
                                                      '₹${provider['data'][index]['order_products'][itemIndex]['price']} x${provider['data'][index]['order_products'][itemIndex]['quantity']}'),
                                                ],
                                              )
                                            ],
                                          ),
                                      ])),
                            )
                        ],
                      ),
                    ),
                    itemCount: provider['data'].length,
                  ),
                ),
        ));
  }
}
