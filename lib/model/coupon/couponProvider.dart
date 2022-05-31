import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './couponModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CouponProvider with ChangeNotifier {
  String baseUrl = 'http://127.0.0.1:8000/';
  Map<String, dynamic> _coupon = {};
  Map<String, dynamic> _couponDetails = {};

  Map<String, dynamic> get coupon {
    return {..._coupon};
  }

  Map<String, dynamic> get couponDetails {
    return {..._couponDetails};
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

  applyCoupon(String code) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/offer/apply/');
    final response =
        await http.post(url, body: json.encode({'offer_code': code}), headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    var res = json.decode(response.body);

    return res;
  }

  Future<void> getCouponDetails(String id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/offer/offer/$id');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });

    _couponDetails = json.decode(response.body);

    // localStorage.setString('couponDetails', json.encode(response.body));

    // var code = localStorage.getString('couponDetails');

    // var res = json.decode(code!);

    // print('Code ${res['min_order_amt']}');

    localStorage.setString('couponCode', _couponDetails['offer_code']);
    localStorage.setString('couponAmount', _couponDetails['min_order_amt']);

    print('Coupon Details: $_couponDetails');
  }
}
