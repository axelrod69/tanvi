import 'package:flutter/material.dart';
import './screens/signIn.dart';
import './screens/signUp.dart';
import './screens/homeScreen.dart';
import './screens/categoryScreen.dart';
import './widgets/categories/categoryList.dart';
import './screens/itemDetail.dart';
import './screens/cartScreen.dart';
import './screens/dashboard.dart';
import './screens/notifications.dart';
import './screens/profile.dart';
import './widgets/cart/checkout.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
      home: SignIn(),
      routes: {
        '/sign-in': (context) => SignIn(),
        '/sign-up': (context) => SignUp(),
        '/home-screen': (context) => HomeScreen(),
        '/category-screen': (context) => CategoryScreen(),
        '/category-list': (context) => CategoryList(),
        '/item-details': (context) => ItemDetails(),
        '/cart-screen': (context) => CartScreen(),
        '/dashboard-screen': (context) => Dashboard(),
        '/notification-screen': (context) => Notifications(),
        '/profile-screen': (context) => Profile(),
        '/checkout-screen': (context) => CheckOut(),
      },
    );
  }
}
