import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddToCartProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';

  dynamic postToCart(int productId, int quantity) async {
    print('productId $productId');
    print('quantity $quantity');
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var data = {'product': productId, 'quantity': quantity};
    final url = Uri.parse(baseUrl + 'api/add-to-cart/');
    final response = await http.post(url, body: {
      'product': productId.toString(),
      'quantity': quantity.toString()
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    });
    // print('Added To Cart: ${response.body}');
    // final responseData = json.decode(response.body);
    return response;
  }

  Future<void> editCartItem(int productId, int quantity) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/$productId/');
    final response = await http.put(url, body: {
      'product': productId.toString(),
      'quantity': quantity.toString()
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    });
    print(response.body);
  }

  Future<void> deleteCartItem(int productId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/$productId/');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    print(response.body);
    notifyListeners();
  }
}