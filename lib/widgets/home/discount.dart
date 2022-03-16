import 'package:flutter/material.dart';

class Discount extends StatefulWidget {
  DiscountState createState() => DiscountState();
}

class DiscountState extends State<Discount> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Padding(
      padding: EdgeInsets.only(left: width * 0.01, right: width * 0.01),
      child: Container(
          width: width * 0.95,
          height: height * 0.22,
          padding: EdgeInsets.only(
            left: width * 0.02,
            top: height * 0.01,
            right: width * 0.02,
            // bottom: height * 0.01
          ),
          // color: Colors.red,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Stack(
                children: [
                  Container(
                    width: width * 0.75,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.greenAccent[100],
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ]),
                  ),
                  Positioned(
                    left: width * 0.02,
                    top: height * 0.05,
                    child: Image.asset('assets/images/veg.png'),
                  ),
                  Positioned(
                    left: width * 0.26,
                    top: height * 0.035,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '50% Discount',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          'Order from the App',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Buy Now',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(width: width * 0.04),
              Stack(
                children: [
                  Container(
                    width: width * 0.75,
                    height: height * 0.2,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(240, 189, 99, 1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ]),
                  ),
                  Positioned(
                    left: width * 0.01,
                    top: height * 0.02,
                    child: Image.asset('assets/images/spoons.png'),
                  ),
                  Positioned(
                    left: width * 0.2,
                    top: height * 0.035,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '50% Discount',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                        Text(
                          'Order from the App',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'Buy Now',
                          textScaleFactor: textScaleFactor,
                          style: const TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
