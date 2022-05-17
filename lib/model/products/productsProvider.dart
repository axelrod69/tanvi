import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  Map<String, dynamic> _products = {};

  Map<String, dynamic> get products {
    return {..._products};
  }

  Future<void> getProducts() async {
    final url = Uri.parse(baseUrl + 'api/products');
    final response = await http.get(url);
    _products = json.decode(response.body);
    print('Products: $_products');
  }
}
