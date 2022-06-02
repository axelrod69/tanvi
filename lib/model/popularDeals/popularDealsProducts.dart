import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PopularDealsProvider with ChangeNotifier {
  String baseUrl = 'http://54.80.135.220/';
  Map<String, dynamic> _popularDeals = {};

  Map<String, dynamic> get popularDeals {
    return {..._popularDeals};
  }

  Future<void> getPopularDeals() async {
    final url = Uri.parse(baseUrl + 'api/dashboard/popular/ordered-product/');

    final response = await http.get(url);

    var res = json.decode(response.body);

    _popularDeals = res;

    print('PopularDeals $_popularDeals');
  }
}
