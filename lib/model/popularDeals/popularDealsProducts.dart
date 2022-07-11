import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularDealsProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
  Map<String, dynamic> _popularDeals = {};

  Map<String, dynamic> get popularDeals {
    return {..._popularDeals};
  }

  Future<void> getPopularDeals() async {
    print('Before API Call: $_popularDeals');

    final url = Uri.parse(baseUrl + 'api/dashboard/popular/ordered-product/');

    final response = await http.get(url);

    var res = json.decode(response.body);

    _popularDeals = res;

    print('API Called');

    print('PopularDeals $_popularDeals');
  }
}
