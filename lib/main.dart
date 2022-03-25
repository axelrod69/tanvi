import 'package:flutter/material.dart';
import './screens/signIn.dart';
import './screens/signUp.dart';
import './screens/homeScreen.dart';
import './screens/categoryScreen.dart';
import './widgets/categories/categoryList.dart';
import './screens/itemDetail.dart';

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
        '/sign-up': (context) => SignUp(),
        '/home-screen': (context) => HomeScreen(),
        '/category-screen': (context) => CategoryScreen(),
        '/category-list': (context) => CategoryList(),
        'item-details': (context) => ItemDetails()
      },
    );
  }
}
