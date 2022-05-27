import 'package:flutter/material.dart';
import './categoryProductsModel.dart';
import 'package:http/http.dart' as http;

class CategoryProductsProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.111:3000/';
  Map<String, dynamic> _categoryProducts = {};

  Map<String, dynamic> get categoryProducts {
    return {..._categoryProducts};
  }

  Future<void> getCategoryProducts(int id) async {
    final url = Uri.parse(baseUrl + 'api/products?category=$id');
    final response =
        await http.get(url, headers: {'Content-Type': 'application/json'});
    // print(response.body);
    CategoryProducts category = categoryProductsFromJson(response.body);
    _categoryProducts = category.toJson();

    for (int index = 0; index < _categoryProducts['data'].length; index++) {
      _categoryProducts['data'][index]['selectedQuantity'] = 0;
      print(
          'Quantity: ${_categoryProducts['data'][index]['selectedQuantity']}');
    }

    print('Category Products $_categoryProducts');
  }
}
