import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddressProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _addressList = {};
  Map<String, dynamic> _defaultAddressSearch = {};
  String? _defaultAddress;

  Map<String, dynamic> get addressList {
    return {..._addressList};
  }

  String? get defaultAddress {
    return _defaultAddress;
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

  Future<void> getDefaultAddress() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/shipping-address/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    _defaultAddressSearch = json.decode(response.body);

    for (int i = 0; i < _defaultAddressSearch['data'].length; i++) {
      if (_defaultAddressSearch['data'][i]['is_default'] == true) {
        _defaultAddress =
            '${_defaultAddressSearch['data'][i]['address_line']}, ${_defaultAddressSearch['data'][i]['locality']}, ${_defaultAddressSearch['data'][i]['city']}, ${_defaultAddressSearch['data'][i]['state']}, ${_defaultAddressSearch['data'][i]['postcode']}';
        break;
      } else {
        continue;
      }
    }
    print('Default Address: $_defaultAddressSearch');
  }
}
