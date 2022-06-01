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
import 'package:provider/provider.dart';
import '../model/profile/profileProvider.dart';
import '../model/address/addressProvider.dart';
import '../model/orderHistory/orderHistory.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigationState createState() => CustomBottomNavigationState();
}

class CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int index = 2;
  bool isLoading = true;
  int length = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    Provider.of<Network>(context, listen: false).getToken();
    Provider.of<AddToCartProvider>(context, listen: false).length;
    Provider.of<AddToCartProvider>(context, listen: false)
        .getCartProducts()
        .then((_) {
      Provider.of<ProfileProvider>(context, listen: false)
          .getProfileDetails()
          .then((_) {
        Provider.of<AddressProvider>(context, listen: false)
            .getDefaultAddress()
            .then((_) {
          // Provider.of<OrderHistoryProvider>(context, listen: false)
          //     .getOrderHistory()
          //     .then((_) {
          setState(() {
            isLoading = false;
          });
          // });
        });
      });
      setState(() {
        length = Provider.of<AddToCartProvider>(context, listen: false)
            .cartData['data']['cartItem']
            .length;
      });
    });

    super.didChangeDependencies();
  }

  final screens = [
    CartScreen(),
    Dashboard(),
    HomeScreen(),
    Notifications(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<AddToCartProvider>(context).cartData;
    final profileProvider = Provider.of<ProfileProvider>(context).profile;
    final cartLength =
        Provider.of<AddToCartProvider>(context, listen: false).length;
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
        bottomNavigationBar: isLoading
            ? const Text('Loading...')
            : Container(
                height: height * 0.06,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: height * 0.02),
                // color: Colors.red,
                child: Stack(
                  children: [
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            width: tabLayout ? width * 0.7 : width * 0.75,
                            height: !tabLayout && !largeLayout
                                ? height * 0.08
                                : height * 0.05,
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
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            index = 0;
                                          });
                                        },
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
                                                    height: height * 0.07,
                                                    width: width * 0.07,
                                                  ),
                                      ),
                                      SizedBox(width: width * 0.1),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            index = 1;
                                          });
                                        },
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
                                                    height: height * 0.07,
                                                    width: width * 0.07,
                                                  ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: double.infinity,
                                  width: width * 0.35,
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: !tabLayout && !largeLayout
                                                ? width * 0.08
                                                : width * 0.08),
                                        child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              index = 3;
                                            });
                                          },
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
                                                      height: height * 0.06,
                                                      width: width * 0.06,
                                                    ),
                                        ),
                                      ),
                                      SizedBox(width: width * 0.1),
                                      InkWell(
                                        onTap: () {
                                          setState(() {
                                            index = 4;
                                          });
                                        },
                                        child: tabLayout
                                            ? profileProvider['data']
                                                        ['profile_pic'] ==
                                                    null
                                                ? CircleAvatar(
                                                    radius: width * 0.06,
                                                    backgroundColor:
                                                        Colors.green,
                                                  )
                                                : CircleAvatar(
                                                    radius: width * 0.06,
                                                    child: Image.network(
                                                        'http://192.168.0.154:3000${profileProvider['data']['profile_pic']}'))
                                            : largeLayout
                                                // ? Image.asset(
                                                //     'assets/images/rkwxkca7.png',
                                                //   )
                                                ? profileProvider['data']
                                                            ['profile_pic'] ==
                                                        null
                                                    ? const CircleAvatar(
                                                        radius: 16,
                                                        backgroundColor:
                                                            Colors.green,
                                                      )
                                                    : CircleAvatar(
                                                        radius: 16,
                                                        child: Image.network(
                                                            'http://192.168.0.154:3000${profileProvider['data']['profile_pic']}'))
                                                : profileProvider['data']
                                                            ['profile_pic'] ==
                                                        null
                                                    ? CircleAvatar(
                                                        radius: width * 0.09,
                                                        backgroundColor:
                                                            Colors.green,
                                                      )
                                                    : CircleAvatar(
                                                        radius: width * 0.09,
                                                        child: Image.network(
                                                            'http://192.168.0.154:3000${profileProvider['data']['profile_pic']}')),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            left: width * 0.08,
                            child: CircleAvatar(
                              radius: tabLayout
                                  ? 13
                                  : largeLayout
                                      ? 9
                                      : 8,
                              backgroundColor: Colors.green,
                              child: Text(
                                // '0',
                                // cartLength > 9 ? '9+' : cartLength.toString(),
                                length > 9 ? '9+' : length.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: tabLayout
                                        ? 14
                                        : largeLayout
                                            ? 12
                                            : 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
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
                : largeLayout
                    ? Container(
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
                      )
                    : Container(
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
                          'assets/images/Icon ionic-ios-home.png',
                        )),
                      ),
          ),
        ));
  }
}
