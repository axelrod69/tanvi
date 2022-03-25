import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Container(
      height: height * 0.15,
      width: double.infinity,
      color: Colors.red,
      // padding: EdgeInsets.only(
      //   left: width * 0.15, top: height * 0.08,
      //   //  right: width * 0.04
      // ),
      padding: EdgeInsets.only(top: height * 0.035),
      child: Stack(
        children: [
          Center(
            child: Container(
              width: width * 0.85,
              height: height * 0.06,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5, offset: Offset(0, 2))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: double.infinity,
                    width: width * 0.35,
                    padding: EdgeInsets.only(left: width * 0.02),
                    // color: Colors.red,
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/cart-screen'),
                          child: Image.asset(
                              'assets/images/Icon awesome-shopping-cart.png'),
                        ),
                        SizedBox(width: width * 0.1),
                        InkWell(
                          onTap: () => Navigator.of(context)
                              .pushNamed('/dashboard-screen'),
                          child: Image.asset(
                              'assets/images/Icon ionic-ios-settings.png'),
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
                            onTap: () => Navigator.of(context)
                                .pushNamed('/notification-screen'),
                            child: Image.asset(
                                'assets/images/Icon awesome-bell.png'),
                          ),
                        ),
                        SizedBox(width: width * 0.1),
                        InkWell(
                            onTap: () => Navigator.of(context)
                                .pushNamed('/profile-screen'),
                            child: Image.asset('assets/images/rkwxkca7.png'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: InkWell(
              onTap: () => Navigator.of(context).pushNamed('/home-screen'),
              child: Container(
                height: height * 0.075,
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
                    child:
                        Image.asset('assets/images/Icon ionic-ios-home.png')),
              ),
            ),
          )
        ],
      ),
    );
  }
}
