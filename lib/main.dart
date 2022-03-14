import 'package:flutter/material.dart';
import './screens/signIn.dart';
import './screens/signUp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(249, 240, 255, 1)),
      home: SignIn(),
      routes: {
        '/sign-in': (context) => SignIn(),
        '/sign-up': (context) => SignUp()
      },
    );
  }
}
