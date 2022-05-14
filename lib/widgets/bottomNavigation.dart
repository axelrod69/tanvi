import 'package:flutter/material.dart';
import '../screens/cartScreen.dart';
import '../screens/dashboard.dart';
import '../screens/homeScreen.dart';
import '../screens/notifications.dart';
import '../screens/profile.dart';
import 'package:provider/provider.dart';
import '../authentication/network.dart';
import '../model/addToCart/addToCart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int index = 2;
  bool isLoading = true;

  final screens = [
    CartScreen(),
    Dashboard(),
    HomeScreen(),
    Notifications(),
    Profile()
  ];

  @override
  void initState() {
    // TODO: implement initState
    Provider.of<Network>(context, listen: false).getToken();
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
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
    final provider = Provider.of<AddToCartProvider>(context).cartData;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;

    // TODO: implement build
    return Scaffold(
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              )
            : screens[index],
        extendBody: true,
        bottomNavigationBar: Container(
          height: height * 0.06,
          width: double.infinity,
          margin: EdgeInsets.only(bottom: height * 0.02),
          // color: Colors.red,
          // padding: EdgeInsets.only(
          //   left: width * 0.15, top: height * 0.08,
          //   //  right: width * 0.04
          // ),
          // padding: EdgeInsets.only(top: height * 0.035),
          child: Stack(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: tabLayout ? width * 0.7 : width * 0.75,
                      height: height * 0.05,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: double.infinity,
                            width: width * 0.35,
                            padding: EdgeInsets.only(left: width * 0.02),
                            // color: Colors.amber,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  // onTap: () =>
                                  //     Navigator.of(context).pushNamed('/cart-screen'),
                                  onTap: () {
                                    // Navigator.of(context).pushNamed('/cart-screen');
                                    // print('Cart Screen');
                                    setState(() {
                                      index = 0;
                                    });
                                  },
                                  // onTap: () {
                                  //   screens[selectedItem] = 0 as StatefulWidget;
                                  // setState(() {

                                  // });

                                  child: tabLayout
                                      ? Image.asset(
                                          'assets/images/Icon awesome-shopping-cart.png',
                                          height: height * 0.1,
                                          width: width * 0.1,
                                        )
                                      : largeLayout
                                          ? Image.asset(
                                              'assets/images/Icon awesome-shopping-cart.png',
                                            )
                                          : Image.asset(
                                              'assets/images/Icon awesome-shopping-cart.png',
                                            ),
                                ),
                                SizedBox(width: width * 0.1),
                                InkWell(
                                  // onTap: () => Navigator.of(context)
                                  //     .pushNamed('/dashboard-screen'),
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pushNamed('/dashboard-screen');
                                    // print('Dashboard Screen');
                                    setState(() {
                                      index = 1;
                                    });
                                  },
                                  // onTap: () {
                                  //   screens[selectedItem] = 1 as StatefulWidget;
                                  //   // setState(() {

                                  //   // });
                                  // },
                                  // child: Image.asset(
                                  //     'assets/images/Icon ionic-ios-settings.png'),
                                  child: tabLayout
                                      ? Image.asset(
                                          'assets/images/Icon ionic-ios-settings.png',
                                          height: height * 0.05,
                                          width: width * 0.05,
                                        )
                                      : largeLayout
                                          ? Image.asset(
                                              'assets/images/Icon ionic-ios-settings.png',
                                            )
                                          : Image.asset(
                                              'assets/images/Icon ionic-ios-settings.png',
                                            ),
                                )
                              ],
                            ),
                          ),
                          Container(
                            height: double.infinity,
                            width: width * 0.35,
                            // padding: EdgeInsets.only(right: width * 0.02),
                            // color: Colors.blue,
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: width * 0.06),
                                  child: InkWell(
                                    // onTap: () => Navigator.of(context)
                                    //     .pushNamed('/notification-screen'),
                                    onTap: () {
                                      // Navigator.of(context)
                                      //     .pushNamed('/notification-screen');
                                      // print('Notification Screen');
                                      setState(() {
                                        index = 3;
                                      });
                                    },
                                    // onTap: () {
                                    //   screens[selectedItem] = 3 as StatefulWidget;
                                    //   // setState(() {

                                    //   // });
                                    // },
                                    // child: Image.asset(
                                    //     'assets/images/Icon awesome-bell.png'),
                                    child: tabLayout
                                        ? Image.asset(
                                            'assets/images/Icon awesome-bell.png',
                                            height: height * 0.03,
                                            width: width * 0.03,
                                          )
                                        : largeLayout
                                            ? Image.asset(
                                                'assets/images/Icon awesome-bell.png',
                                              )
                                            : Image.asset(
                                                'assets/images/Icon awesome-bell.png',
                                              ),
                                  ),
                                ),
                                SizedBox(width: width * 0.1),
                                InkWell(
                                  // onTap: () {
                                  //   screens[selectedItem] = 4 as StatefulWidget;
                                  //   // setState(() {

                                  //   // });
                                  // },
                                  // onTap: () => Navigator.of(context)
                                  //     .pushNamed('/profile-screen'),
                                  onTap: () {
                                    // Navigator.of(context)
                                    //     .pushNamed('/profile-screen');
                                    // print('Profile Screen');
                                    setState(() {
                                      index = 4;
                                    });
                                  },
                                  // child: Image.asset(
                                  //     'assets/images/rkwxkca7.png')
                                  child: tabLayout
                                      ? Image.asset(
                                          'assets/images/rkwxkca7.png',
                                          height: height * 0.06,
                                          width: width * 0.06,
                                        )
                                      : largeLayout
                                          ? Image.asset(
                                              'assets/images/rkwxkca7.png',
                                            )
                                          : Image.asset(
                                              'assets/images/rkwxkca7.png',
                                            ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    // Positioned(
                    //   top: height * 0.001,
                    //   left: width * 0.08,
                    //   child: CircleAvatar(
                    //     radius: tabLayout ? width * 0.02 : width * 0.025,
                    //     backgroundColor: Colors.green,
                    //     child: Text(
                    //         provider['data']['cartItem'].length.toString(),
                    //         style: const TextStyle(
                    //             color: Colors.white,
                    //             fontWeight: FontWeight.bold)),
                    //   ),
                    // )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.of(context).pushNamed('/home-screen');
            setState(() {
              index = 2;
            });
          },
          child: Align(
            alignment: Alignment.topCenter,
            child: tabLayout
                ? CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: height * 0.8,
                  )
                : Container(
                    // height: height * 0.075,
                    // width: width * 0.8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 5,
                              offset: Offset(0, 2))
                        ],
                        border: Border.all(
                            color: Colors.green,
                            width: 2,
                            style: BorderStyle.solid)),
                    child: Center(
                        child: Image.asset(
                            'assets/images/Icon ionic-ios-home.png')),
                  ),
          ),
        ));
  }
}
