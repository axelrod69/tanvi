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
import './widgets/bottomNavigation.dart';
import 'package:provider/provider.dart';
import './authentication/network.dart';
import './screens/otpScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './model/category/categoryProvider.dart';
import './model/categoryProducts/categoryProductsProvider.dart';
import './model/location/location.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  bool isAuth = false;

  @override
  void initState() {
    // TODO: implement initState

    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    // SharedPreferences refresh = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    // localStorage.remove('token');
    // localStorage.remove('refresh');
    print('Access Tokeeeeeeeeeeeeeeeen : ${localStorage.getString('token')}');
    print(
        'Refressssssssssh Tokeeeeeeeeeen : ${localStorage.getString('refresh')}');
    if (token != null) {
      setState(() {
        isAuth = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Network(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocationProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
        // home: isAuth ? CustomBottomNavigation() : SignIn(),
        home: CustomBottomNavigation(),
        routes: {
          '/landing-page': (context) => CustomBottomNavigation(),
          '/sign-in': (context) => SignIn(),
          '/sign-up': (context) => SignUp(),
          '/home-screen': (context) => HomeScreen(),
          '/category-screen': (context) => CategoryScreen(),
          // '/category-list': (context) => CategoryList(),
          '/item-details': (context) => ItemDetails(),
          '/cart-screen': (context) => CartScreen(),
          '/dashboard-screen': (context) => Dashboard(),
          '/notification-screen': (context) => Notifications(),
          '/profile-screen': (context) => Profile(),
          '/checkout-screen': (context) => CheckOut(),
          '/otp-screen': (context) => OtpScreen(),
        },
      ),
    );
  }
}
