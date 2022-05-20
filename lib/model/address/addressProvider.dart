import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddressProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _addressList = {};

  Map<String, dynamic> get addressList {
    return {..._addressList};
  }

  Future<void> getAddressList() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/shipping-address/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    _addressList = json.decode(response.body);
    print('Address List: $_addressList');
  }
}
