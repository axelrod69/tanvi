import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
import './model/addToCart/addToCart.dart';
import './model/wishList/wishList.dart';
import './screens/itemDetailsTwo.dart';
import './screens/address.dart';
import './model/changeLocation/changeLocation.dart';
import './model/coupon/couponProvider.dart';
import './model/order/orderProvider.dart';
import './model/popularDeals/popularDealsProducts.dart';
import './model/products/productsProvider.dart';
import './model/topProducts/topProductsProvider.dart';
import './model/profile/profileProvider.dart';
import './screens/orderScreen.dart';
import './screens/searchScreen.dart';
import './screens/categorySearchScreen.dart';
import './model/orderHistory/orderHistory.dart';
import './model/address/addressProvider.dart';
import './screens/addressList.dart';
import './screens/newAddressSelect.dart';
import './model/rating/ratingProvider.dart';
import './screens/onBoardingScreen.dart';
import './notificatonService/localNotification.dart';
import './model/notificationList/notificationList.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  runApp(MyApp());
}

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
    bool isExpired = JwtDecoder.isExpired(token!);

    print('COUPON CODE: ${localStorage.getString('couponCode')}');
    print('COUPON AMOUNT: ${localStorage.getString('couponAmount')}');

    localStorage.remove('couponCode');
    localStorage.remove('couponAmount');

    print('TOKEN EXPIRY: $isExpired');
    // localStorage.remove('token');
    // localStorage.remove('refresh');
    print('Access Tokeeeeeeeeeeeeeeeen : ${localStorage.getString('token')}');
    print(
        'Refressssssssssh Tokeeeeeeeeeen : ${localStorage.getString('refresh')}');
    if (token != null && isExpired == false) {
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
        ),
        ChangeNotifierProvider(create: (context) => AddToCartProvider()),
        ChangeNotifierProvider(create: (context) => WishListProvider()),
        ChangeNotifierProvider(create: (context) => ChangeLocationProvider()),
        ChangeNotifierProvider(create: (context) => CouponProvider()),
        ChangeNotifierProvider(create: (context) => OrderProvider()),
        ChangeNotifierProvider(create: (context) => PopularDealsProvider()),
        ChangeNotifierProvider(create: (context) => ProductsProvider()),
        ChangeNotifierProvider(create: (context) => TopProductsProvider()),
        ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ChangeNotifierProvider(create: (context) => OrderHistoryProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => RatingProvider()),
        ChangeNotifierProvider(create: (context) => NotificationList())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: const Color.fromRGBO(236, 236, 248, 1)),
        home: isAuth ? CustomBottomNavigation() : OnBoardingScreen(),
        // home: OnBoardingScreen(),
        routes: {
          '/onboarding-screens': (context) => OnBoardingScreen(),
          '/landing-page': (context) => CustomBottomNavigation(),
          '/sign-in': (context) => SignIn(),
          // '/sign-up': (context) => SignUp(),
          '/home-screen': (context) => HomeScreen(),
          '/category-screen': (context) => CategoryScreen(),
          // '/category-list': (context) => CategoryList(),
          '/item-details': (context) => ItemDetails(),
          'item-details-two': (context) => ItemDetailsTwo(),
          '/cart-screen': (context) => CartScreen(),
          '/dashboard-screen': (context) => Dashboard(),
          // '/notification-screen': (context) => Notifications(),
          // '/profile-screen': (context) => Profile(),
          '/checkout-screen': (context) => CheckOut(),
          '/otp-screen': (context) => OtpScreen(),
          '/change-location': (context) => ChangeLocation(),
          '/order-screen': (context) => PageViewScreenOrder(),
          '/search-screen': (context) => Search(),
          '/categories-search': (context) => CategorySearch(),
          '/address-list': (context) => AddressList(),
          '/new-address-select': (context) => ChangeNewLocation(),
          // '/payment-verification': (context) => PaymentLoadingScreen(),
        },
      ),
    );
  }
}
