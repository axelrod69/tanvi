import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class OrderProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
  Map<String, dynamic> _orderId = {};
  Map<String, dynamic> _verification = {};

  Map<String, dynamic> get orderId {
    return {..._orderId};
  }

  Map<String, dynamic> get verification {
    return {..._verification};
  }

  Future<Map<String, dynamic>> postRazorpayTest() async {
    final url = Uri.parse(baseUrl + 'api/customer/order-payment/create/');

    final response = await http.post(url);

    _orderId = json.decode(response.body);

    print('ORDER ID: $_orderId');

    return _orderId;
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
    print('RAZORPAYR 108: ${_orderId}');
    return _orderId;
  }

  Future<Map<String, dynamic>> razorPayVerification(String orderNumber,
      String orderId, String paymentId, String signature) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();

    var body = {
      'order_number': orderNumber,
      'razorpay_order_id': orderId,
      'razorpay_payment_id': paymentId,
      'razorpay_signature': signature
    };

    print('PAYMENT ARGUMENTS: $body');

    final url =
        Uri.parse(baseUrl + 'api/customer/order-place-razorpay-verify/');
    final response = await http.post(url,
        body: json.encode({
          'order_number': orderNumber,
          'razorpay_order_id': orderId,
          'razorpay_payment_id': paymentId,
          'razorpay_signature': signature
        }),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    _verification = json.decode(response.body);
    print('Success Response from Server: $_verification');
    return _verification;
  }

  Future<Map<String, dynamic>> postCodOrder() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/order-place/');
    final response = await http.post(url,
        body: json.encode({
          'offer_code': localStorage.getString('coupon'),
          'payment_method': 'COD'
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
