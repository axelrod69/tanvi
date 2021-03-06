import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
  List<dynamic> _category = [];
  List<dynamic> _categoriesList = [];
  List<dynamic> _catList = [];

  List<dynamic> get category {
    return [..._category];
  }

  List<dynamic> get categoriesList {
    return [..._categoriesList];
  }

  Future<void> getCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    print('Before Category API Call: $_category');
    if (_category.length < 1) {
      final response = await http.get(url);
      _category = json.decode(response.body);

      print('CATEGORY API CALLLLLLLLL');
    }

    print('Categoryssssssssssssss $_category');
  }

  Future<void> getSearchCategory() async {
    final url = Uri.parse(baseUrl + 'api/category-list/');
    final response = await http.get(url);
    _categoriesList = [];
    _catList = json.decode(response.body);
    _catList.forEach((value) => _categoriesList.add(value));
    print(_categoriesList);
  }
}
