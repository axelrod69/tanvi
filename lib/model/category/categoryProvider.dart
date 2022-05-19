import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryProvider with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  List<dynamic> _category = [];
  List<dynamic> _categoriesList = [];

  List<dynamic> get category {
    return [..._category];
  }

  List<dynamic> get categoriesList {
    return [..._categoriesList];
  }

  Future<void> getCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    final response = await http.get(url);
    _category = json.decode(response.body);
    print('Category $_category');
  }

  Future<void> getSearchCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    final response = await http.get(url);
    _categoriesList = json.decode(response.body);
    print(_categoriesList);
  }
}
