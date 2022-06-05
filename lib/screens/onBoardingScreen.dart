import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import './introScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final controller = PageController();

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final tabLayout = width > 600;
    final largeLayout = width > 350 && width < 600;
    final tabLayoutHeight = height > 600;

    // TODO: implement build
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            children: [
              IntroScreen('assets/images/Onborad2.png', 'Fresh Vegetable',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
              IntroScreen('assets/images/Onbraod.png', 'Fresh Vegetable',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  () {
                controller.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              }),
              IntroScreen('assets/images/ONboard3.png', 'Fresh Vegetable',
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                  () {
                Navigator.pushNamed(context, '/sign-in');
              }),
            ],
          ),
          Positioned(
            // top: tabLayout
            //     ? height * 0.40
            //     : largeLayout
            //         ? height * 0.40
            //         : height * 0.5,
            top: height * 0.44,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  dotHeight: 9.0,
                  dotWidth: 9.0,
                  activeDotColor: Colors.green,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
