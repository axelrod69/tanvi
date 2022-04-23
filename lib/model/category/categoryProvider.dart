import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './categoryModel.dart';

class CategoryProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  List<dynamic> _category = [];

  List<dynamic> get category {
    return [..._category];
  }

  Future<void> getCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    final response = await http.get(url);
    // Category category = categoryFromJson(response.body);
    // _products = category.toJson() as List;
    // print(_products);
    _category = json.decode(response.body);
    print('Category $_category');
  }
}
