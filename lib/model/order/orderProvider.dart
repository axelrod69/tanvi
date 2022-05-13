import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _orderId = {};

  Map<String, dynamic> get orderId {
    return {..._orderId};
  }

  Future<Map<String, dynamic>> postRazorPayOrder() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/order-place-razorpay/');
    final response = await http.post(url,
        body: json.encode({
          'offer_code': localStorage.getString('coupon'),
          'payment_method': 'Razorpay'
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });
    _orderId = json.decode(response.body);
    print(_orderId);
    return _orderId;
  }
}
