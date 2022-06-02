import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductsProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _products = {};
  Map<String, dynamic> _search = {};
  Map<String, dynamic> _productsTest = {};
  List<dynamic> _searchProducts = [];

  Map<String, dynamic> get products {
    return {..._products};
  }

  List<dynamic> get searchProducts {
    return [..._searchProducts];
  }

  Future<void> getProducts() async {
    final url = Uri.parse(baseUrl + 'api/products');
    final response = await http.get(url);
    _products = json.decode(response.body);
    print('Products: $_products');
  }

  Future<void> searchProduct() async {
    final url = Uri.parse(baseUrl + 'api/products');
    final response = await http.get(url);
    _productsTest = json.decode(response.body);
    _searchProducts = [];
    _productsTest['data'].forEach((element) => _searchProducts.add(element));
    print('Search Products $_searchProducts');
    notifyListeners();
  }
}
