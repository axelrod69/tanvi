import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './couponModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CouponProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _coupon = {};

  Map<String, dynamic> get coupon {
    return {..._coupon};
  }

  Future<void> fetchCoupons() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/offer/offer-list/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    Coupon couponModel = couponFromJson(response.body);
    _coupon = couponModel.toJson();
    print('Coupons $_coupon');
  }
}
