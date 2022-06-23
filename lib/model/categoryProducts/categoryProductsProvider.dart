import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import './categoryProductsModel.dart';
import 'package:http/http.dart' as http;

class CategoryProductsProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _categoryProducts = {};

  Map<String, dynamic> get categoryProducts {
    return {..._categoryProducts};
  }

  Future<void> getCategoryProducts(int id) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/products?category=$id');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    print(response.body);
    if (response.statusCode == 200) {
      // CategoryProducts category = categoryProductsFromJson(response.body);
      // _categoryProducts = category.toJson();
      _categoryProducts = json.decode(response.body);

      // for (int index = 0; index < _categoryProducts['data'].length; index++) {
      //   _categoryProducts['data'][index]['selectedQuantity'] = 1;
      //   _categoryProducts['data'][index]['isClicked'] = false;
      //   print(
      //       'Quantity: ${_categoryProducts['data'][index]['selectedQuantity']}');
      // }
      print('Category Products: $_categoryProducts');
    } else {
      _categoryProducts = {'data': []};
    }
    // if (response.statusCode == 200) {
    //   _categoryProducts = json.decode(response.body);
    //   print('Category Products: $_categoryProducts');
    // } else {
    //   _categoryProducts = {'data': []};
    // }
  }
}
