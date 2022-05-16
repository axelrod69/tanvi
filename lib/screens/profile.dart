import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import '../model/location/location.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => ProfileState();
}

class ProfileState extends State<Profile> {
  bool isLoading = true;
  var index = 0;
  String? address;

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<LocationProvider>(context, listen: false)
        .getAddress()
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
    // final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;
    final provider = Provider.of<LocationProvider>(context).addressData;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // for (index in provider['data']) {
    //   if (provider['data'][index]['is_default'] == true) {
    //     address =
    //         '${provider['data'][index]['address_line']}, ${provider['data'][index]['locality']}, ${provider['data'][index]['city']}, ${provider['data'][index]['postcode']}, ${provider['data'][index]['state']}';
    //   }
    // }

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: width * 1,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        child: ListView(
          children: [
            Column(
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
                      Flexible(
                        flex: 2,
                        fit: FlexFit.tight,
                        child: Container(
                          // width: width * 0.95,
                          height: height * 0.1,
                          padding: EdgeInsets.only(
                              right: tabLayout ? width * 0.12 : width * 0.06),
                          // color: Colors.red,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Profile',
                                // // textScaleFactor: textScaleFactor,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: tabLayout ? 30 : 25),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        fit: FlexFit.tight,
                        child: Container(
                          height: height * 0.1,
                          padding: EdgeInsets.only(right: width * 0.02),
                          // color: Colors.amber,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                  onTap: logout,
                                  child: Icon(Icons.logout_rounded,
                                      size: tabLayout ? 30 : 24))
                            ],
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
                      left: tabLayout ? width * 0.08 : width * 0.04,
                      right: tabLayout ? width * 0.08 : width * 0.04,
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
                                  // // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: tabLayout ? 55 : 35),
                                ),
                                Text(
                                  'something@somewhere.com',
                                  // // textScaleFactor: textScaleFactor,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: tabLayout ? 35 : 14),
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
                                                        BorderRadius.circular(
                                                            30),
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Colors.green)),
                                                child: Center(
                                                  child: Text(
                                                    'Change Email',
                                                    // textScaleFactor:
                                                    // textScaleFactor,
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: tabLayout
                                                            ? 20
                                                            : 14),
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
                                                            offset:
                                                                Offset(0, 2))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.green)),
                                                  child: Center(
                                                    child: Text(
                                                      'Change Payment',
                                                      // textScaleFactor:
                                                      // textScaleFactor,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: tabLayout
                                                              ? 20
                                                              : 14),
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
                                                            offset:
                                                                Offset(0, 2))
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      border: Border.all(
                                                          width: 2,
                                                          color: Colors.green)),
                                                  child: Center(
                                                    child: Text(
                                                      'Change Mobile Number',
                                                      // textScaleFactor:
                                                      // textScaleFactor,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: tabLayout
                                                              ? 20
                                                              : 14),
                                                    ),
                                                  )),
                                              SizedBox(width: width * 0.02),
                                              InkWell(
                                                onTap: () =>
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            '/change-location'),
                                                child: Container(
                                                    width: width * 0.4,
                                                    height: height * 0.045,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: const [
                                                          BoxShadow(
                                                              color:
                                                                  Colors.grey,
                                                              blurRadius: 5,
                                                              offset:
                                                                  Offset(0, 2))
                                                        ],
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                            width: 2,
                                                            color:
                                                                Colors.green)),
                                                    child: Center(
                                                      child: Text(
                                                        'Add Address',
                                                        // textScaleFactor:
                                                        // textScaleFactor,
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: tabLayout
                                                                ? 20
                                                                : 14),
                                                      ),
                                                    )),
                                              )
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
                              child: CircleAvatar(
                                radius: tabLayout ? 80 : 60,
                                backgroundColor: Colors.amber,
                                // child: Image.asset(
                                //   'assets/images/rkwxkca7.png',
                                // ),
                              ),
                            ),
                            SizedBox(height: height * 0.005),
                            Text(
                              'Edit',
                              // // textScaleFactor: textScaleFactor,
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold,
                                  fontSize: tabLayout ? 20 : 14),
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
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 25 : 14),
                      ),
                    ),
                    SizedBox(width: width * 0.2),
                    Expanded(
                      child: Text(
                        // '48, Tarun Sengupta Sarani, Dum Dum, Kolkata: 700079, West Bengal, India',
                        Provider.of<LocationProvider>(context).deliveryAddress,
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: tabLayout ? 25 : 14),
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
                        'Mobile Number',
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 25 : 14),
                      ),
                    ),
                    SizedBox(width: width * 0.044),
                    Text(
                      '+919831405393',
                      // // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: tabLayout ? 25 : 14),
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
                        'Email',
                        // // textScaleFactor: textScaleFactor,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: tabLayout ? 25 : 14),
                      ),
                    ),
                    SizedBox(width: width * 0.044),
                    Text(
                      'Cash On Delivery',
                      // // textScaleFactor: textScaleFactor,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: tabLayout ? 25 : 14),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: CustomBottomNavigation(),
    );
  }

  void logout() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'refresh': localStorage.getString('refresh')};
    var response = await Provider.of<Network>(context, listen: false)
        .logOut(data, 'api/logout/');
    print(response.body);
    localStorage.remove('token');

    Navigator.of(context).pushNamed('/sign-in').then((_) {
      localStorage.remove('refresh');
    });
  }
}
