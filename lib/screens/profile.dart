import 'package:flutter/material.dart';
import 'package:tanvi/widgets/bottomNavigation.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: height * 0.07,
              // color: Colors.red,
              margin: EdgeInsets.only(top: height * 0.03),
              padding: EdgeInsets.only(left: width * 0.01),
              child: Row(
                children: [
                  // Container(
                  //   height: height * 0.05,
                  //   width: width * 0.1,
                  //   padding: EdgeInsets.only(left: width * 0.025),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10),
                  //       boxShadow: const [
                  //         BoxShadow(
                  //             color: Colors.grey,
                  //             blurRadius: 5,
                  //             offset: Offset(0, 2))
                  //       ]),
                  //   child:
                  //       const Icon(Icons.arrow_back_ios, color: Colors.green),
                  // ),
                  Container(
                    width: width * 0.95,
                    height: height * 0.1,
                    // color: Colors.red,
                    child: Center(
                      child: Text(
                        'Profile',
                        textScaleFactor: textScaleFactor,
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: height * 0.5,
              // color: Colors.red,
              padding: EdgeInsets.only(
                  left: width * 0.04,
                  right: width * 0.04,
                  bottom: height * 0.02),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: height * 0.35,
                        padding: EdgeInsets.only(top: height * 0.08),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 5,
                                  offset: Offset(0, 2))
                            ]),
                        child: Column(
                          children: [
                            Text(
                              'Eli Avon',
                              textScaleFactor: textScaleFactor,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35),
                            ),
                            Text(
                              'something@somewhere.com',
                              textScaleFactor: textScaleFactor,
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                // color: Colors.blue,
                                child: Column(
                                  children: [
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            width: width * 0.4,
                                            height: height * 0.045,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.grey,
                                                      blurRadius: 5,
                                                      offset: Offset(0, 2))
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    width: 2,
                                                    color: Colors.green)),
                                            child: Center(
                                              child: Text(
                                                'Change Email',
                                                textScaleFactor:
                                                    textScaleFactor,
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: width * 0.02),
                                          Container(
                                              width: width * 0.4,
                                              height: height * 0.045,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.green)),
                                              child: Center(
                                                child: Text(
                                                  'Change Payment',
                                                  textScaleFactor:
                                                      textScaleFactor,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                    Flexible(
                                      flex: 1,
                                      fit: FlexFit.tight,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              width: width * 0.4,
                                              height: height * 0.045,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.green)),
                                              child: Center(
                                                child: Text(
                                                  'Change Password',
                                                  textScaleFactor:
                                                      textScaleFactor,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              )),
                                          SizedBox(width: width * 0.02),
                                          Container(
                                              width: width * 0.4,
                                              height: height * 0.045,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  boxShadow: const [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        blurRadius: 5,
                                                        offset: Offset(0, 2))
                                                  ],
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                      width: 2,
                                                      color: Colors.green)),
                                              child: Center(
                                                child: Text(
                                                  'Add Address',
                                                  textScaleFactor:
                                                      textScaleFactor,
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: height * 0.04,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 5,
                                    offset: Offset(0, 2))
                              ]),
                          child: const CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.amber,
                            // child: Image.asset(
                            //   'assets/images/rkwxkca7.png',
                            // ),
                          ),
                        ),
                        SizedBox(height: height * 0.005),
                        Text(
                          'Edit',
                          textScaleFactor: textScaleFactor,
                          style: TextStyle(
                              color: Colors.grey[600],
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Text(
                    'Address',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: width * 0.2),
                Expanded(
                  child: Text(
                    '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal, India',
                    textScaleFactor: textScaleFactor,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                )
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Text(
                    'Password',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: width * 0.17),
                Text(
                  '*********',
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(color: Colors.grey[700]),
                )
              ],
            ),
            SizedBox(height: height * 0.04),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: width * 0.04),
                  child: Text(
                    'Payment Method',
                    textScaleFactor: textScaleFactor,
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: width * 0.044),
                Text(
                  'Cash On Delivery',
                  textScaleFactor: textScaleFactor,
                  style: TextStyle(color: Colors.grey[700]),
                )
              ],
            )
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }
}
