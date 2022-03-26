import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  CheckOutState createState() => CheckOutState();
}

class CheckOutState extends State<CheckOut> {
  int selectedValue = 1;
  final List<dynamic> _categoryItems = [
    {
      'id': 1,
      'name': 'Tomatoes',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 1,
      'image': 'assets/images/tomato-15559.png',
      'weight': '2/KG'
    },
    {
      'id': 2,
      'name': 'Cabbage',
      'discountPrice': '30.00/KG',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 2,
      'image': 'assets/images/PngItem_1310699.png',
      'weight': '2/KG'
    },
    {
      'id': 3,
      'name': 'Onions',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 3,
      'image': 'assets/images/tomato-15559.png',
      'weight': '2/KG'
    },
    {
      'id': 4,
      'name': 'Turnip',
      'discountPrice': '30.00/kg',
      'actualPrice': '₹ 30.25',
      'decription':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
      'quantity': 4,
      'image': 'assets/images/PngItem_1310699.png',
      'weight': '2/KG'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        automaticallyImplyLeading: false,
        leading: Container(
            width: width * 0.1,
            margin: EdgeInsets.only(left: width * 0.01),
            //height: height * 0.02,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                ]),
            child: Center(
                child: Padding(
              padding: EdgeInsets.only(left: width * 0.02),
              child: const Icon(Icons.arrow_back_ios, color: Colors.green),
            ))),
        title: Text('Checkout',
            textScaleFactor: textScaleFactor,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Container(
        height: height * 1,
        width: width * 1,
        padding: EdgeInsets.only(left: width * 0.04, right: height * 0.04),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.08,
              margin: EdgeInsets.only(top: height * 0.02),
              decoration: const BoxDecoration(
                  color: Colors.transparent,
                  border: Border(
                      top: BorderSide(color: Colors.green, width: 1),
                      bottom: BorderSide(color: Colors.green, width: 1))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Order No:',
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: width * 0.01),
                        Text('ABvCD32',
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Estimated Delivery Time:',
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        SizedBox(width: width * 0.01),
                        Text('38 mins',
                            textScaleFactor: textScaleFactor,
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.015),
            Text('Your order',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(fontSize: 18)),
            Text('12 product(s) from Wee Food',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(fontSize: 15)),
            SizedBox(height: height * 0.015),
            Container(
              width: double.infinity,
              height: height * 0.14,
              // color: Colors.red,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => Container(
                  width: width * 0.26,
                  height: height * 0.1,
                  padding: EdgeInsets.only(
                    // left: width * 0.02,
                    top: height * 0.01,
                    // right: height * 0.02
                  ),
                  // color: Colors.amber,
                  margin: EdgeInsets.only(right: width * 0.001),
                  child: Column(
                    children: [
                      Container(
                          height: height * 0.1,
                          width: height * 0.1,
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.01,
                              horizontal: width * 0.01),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.green, width: 2),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: Image.asset(_categoryItems[index]['image'])),
                      Text(
                        _categoryItems[index]['name'],
                        textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                itemCount: _categoryItems.length,
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: height * 0.15,
              // color: Colors.red,
              padding: EdgeInsets.only(left: width * 0.02, right: width * 0.02),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Amount To Pay',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('₹250',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Coupon',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('FREE',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Delivery Fee',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                      Text('₹10',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13))
                    ],
                  ),
                  SizedBox(height: height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Payment Method',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 13)),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Container(
              width: double.infinity,
              height: height * 0.12,
              padding:
                  EdgeInsets.only(left: width * 0.04, right: height * 0.02),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cash On Delivery',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Radio(
                          value: 1,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as int;
                            });
                          })
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Razorpay',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 13),
                      ),
                      Radio(
                          value: 2,
                          groupValue: selectedValue,
                          onChanged: (value) {
                            setState(() {
                              selectedValue = value as int;
                            });
                          })
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Delivery',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                Text(
                  'Change Location',
                  textScaleFactor: textScaleFactor,
                  style: const TextStyle(
                      color: Colors.black,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ],
            ),
            Container(
              width: double.infinity,
              height: height * 0.18,
              // color: Colors.red,
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04, vertical: height * 0.02),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.assistant_direction_rounded,
                                  color: Colors.green),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              '124, Park Street, Kolkata: 700016, West Bengal',
                              // overflow: TextOverflow.ellipsis,
                              textScaleFactor: textScaleFactor,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(color: Colors.black, width: 2)),
                            child: const CircleAvatar(
                              radius: 18,
                              backgroundColor: Colors.white,
                              child: Icon(Icons.arrow_drop_down_circle_outlined,
                                  color: Colors.green),
                            ),
                          ),
                          SizedBox(width: width * 0.03),
                          Expanded(
                            child: Text(
                              '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal',
                              // overflow: TextOverflow.ellipsis,
                              textScaleFactor: textScaleFactor,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * 0.0472,
                    left: width * 0.042,
                    child: Container(
                      width: width * 0.01,
                      height: height * 0.045,
                      // color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                              width: double.infinity,
                              height: height * 0.006,
                              color: Colors.green,
                              margin: EdgeInsets.only(bottom: height * 0.002)),
                          Container(
                            width: double.infinity,
                            height: height * 0.005,
                            color: Colors.green,
                            // margin: EdgeInsets.only(bottom: height * 0.002)
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
                width: width * 0.1,
                height: height * 0.06,
                margin: EdgeInsets.only(bottom: height * 0.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.green,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]))
          ],
        ),
      ),
    );
  }
}
