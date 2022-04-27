import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import './addToCartModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddToCartGet with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _cartData = {};

  Map<String, dynamic> get cartData {
    return {..._cartData};
  }

  Future<void> getCartProducts() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    // print(response.body);
    var res = json.decode(response.body);
    _cartData = res;
    // AddToCartData addToCartData = addToCartDataFromJson(response.body);
    // _cartData = addToCartData.toJson();
    print('Add To Cart: $_cartData');
  }
}
