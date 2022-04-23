import 'package:flutter/material.dart';
import './categoryProductsModel.dart';
import 'package:http/http.dart' as http;

class CategoryProductsProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
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
    print('Category Products $_categoryProducts');
  }
}
