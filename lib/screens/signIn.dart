import 'dart:ui';
import 'package:flutter/material.dart';
import '../widgets/signIn/sign_in.dart';
import './signUp.dart';

// class SignIn extends StatefulWidget {
//   SignInState createState() => SignInState();
// }

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final textScaleFactor = MediaQuery.of(context).textScaleFactor * 1.2;

    // TODO: implement build
    return Scaffold(
      body: Container(
        height: height * 1,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Rectangle 392.png'),
                fit: BoxFit.cover)),
        // margin: EdgeInsets.only(top: height * 0.15),
        padding: EdgeInsets.only(top: height * 0.15),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Welcome',
                textScaleFactor: textScaleFactor,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Center(
              child: Text(
                'Login to start shopping',
                textScaleFactor: textScaleFactor,
                style: const TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(154, 154, 154, 1),
                    fontSize: 20),
              ),
            ),
            SizedBox(height: height * 0.04),
            FormWidget(),
          ],
        ),
      ),
    );
  }
}
