import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class AddToCartProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
  Map<String, dynamic> _cartData = {};
  List<dynamic> _cartList = [];
  int _length = 0;
  // Map<String, String> _cart = {};

  Map<String, dynamic> get cartData {
    return {..._cartData};
  }

  List<dynamic> get cartList {
    return [..._cartList];
  }

  int get length {
    return _length;
  }

  // Future<Map<String, dynamic>> getCartProducts() async {
  //   SharedPreferences localStorage = await SharedPreferences.getInstance();
  //   final url = Uri.parse(baseUrl + 'api/add-to-cart/');
  //   final response = await http.get(url, headers: {
  //     'Authorization': 'Bearer ${localStorage.getString('token')}',
  //     'Content-Type': 'application/json'
  //   });
  //   // print(response.body);
  //   var res = json.decode(response.body);
  //   _cartData = res;
  //   // AddToCartData addToCartData = addToCartDataFromJson(response.body);
  //   // _cartData = addToCartData.toJson();
  //   // print('Add To Cart: $_cartData');
  //   print('Calleddddddddddddddddd');
  //   return res;
  // }

  // void cartlength(int lengthOfCart) {
  //   _length = lengthOfCart;
  //   print('Length Of Cart: $_length');
  //   notifyListeners();
  // }

  Future<void> getCartProducts() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print('Response ${response.statusCode}');
    // var res = json.decode(response.body);
    // _cartData = res;
    // AddToCartData addToCartData = addToCartDataFromJson(response.body);
    // _cartData = addToCartData.toJson();
    // print('Add To Cart: $_cartData');
    // var res = response.body;
    // print('Cart Data $res');
    if (response.statusCode == 200) {
      _cartData = json.decode(response.body);
      _cartList = _cartData['data']['cartItem'];
      _length = _cartData['data']['cartItem'].length;
      print(
          'Length Of Cartttttttttttttttttttttttttttttttttttttttttttttttttttttt: $_length');
      // notifyListeners();
    } else {
      // if() {}
      _cartData = {
        'data': {'cartItem': []}
      };
      return;
    }
    // _cartData = res as Map<String, dynamic>;

    print('Cart Data: $_cartData');
    // return res;
  }

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
    print('Lengthhhhhhhhhhhhhhhhhhhhhhhh Of Cart: $_length');
    _length = length;
    notifyListeners();
    // print('Added To Cart: ${response.body}');
    // final responseData = json.decode(response.body);
    return response;
  }

  Future<Map<String, dynamic>> editCartItem(
      String productId, int quantity) async {
    print(productId);
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/$productId/');
    final response = await http.put(url, body: {
      // 'product': productId,
      "quantity": quantity.toString()
    }, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      // 'Content-Type': 'application/json'
    });
    var res = json.decode(response.body);
    print('Edit Cart Item $res');
    notifyListeners();
    return res;
  }

  Future<void> deleteCartItem(int productId) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/add-to-cart/$productId/');
    final response = await http.delete(url, headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${localStorage.getString('token')}'
    });
    print('Delete Response: ${response.body}');
    notifyListeners();
  }
}
