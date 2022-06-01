import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class OrderHistoryProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.154:3000/';
  List<dynamic> _orderHistory = [];
  Map<String, dynamic> _pendingHistory = {};
  List<dynamic> _history = [];

  List<dynamic> get orderHistory {
    return [..._orderHistory];
  }

  Map<String, dynamic> get pendingHistory {
    return {..._pendingHistory};
  }

  List<dynamic> get history {
    return [..._history];
  }

  Future<void> getOrderHistory() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-order-history/');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    var res = json.decode(response.body);
    _orderHistory = res;

    for (final order in res) {
      if (order['order']['payment_status'] == 'Pending' &&
          order['order']['order_status'] == 'Order Placed') {
        _pendingHistory = order;
      }
    }

    print('Pending History: $_pendingHistory');

    print('Order History: $_orderHistory');
  }
}
