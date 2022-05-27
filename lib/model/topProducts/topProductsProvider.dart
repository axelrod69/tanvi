import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopProductsProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.111:3000/';
  List<dynamic> _topProductsFirst = [];
  List<dynamic> _topProductsSecond = [];

  List<dynamic> get topProductsFirst {
    return [..._topProductsFirst];
  }

  List<dynamic> get topProductsSecond {
    return [..._topProductsSecond];
  }

  Future<void> getTopProducts() async {
    late int i;
    final url = Uri.parse(baseUrl + 'api/dashboard/fresh/arrival-products/');

    final response = await http.get(url);

    var firstResponse = json.decode(response.body);

    for (i = 0; i < firstResponse['data'].length / 2; i++) {
      // _topProductsFirst = firstResponse['data'][i].toList();
      _topProductsFirst.add(firstResponse['data'][i]);
    }

    for (int j = i; j < firstResponse['data'].length; j++) {
      // _topProductsSecond = firstResponse['data'][j];
      _topProductsSecond.add(firstResponse['data'][j]);
    }

    print('Top Products First: $_topProductsFirst');
    print('Top Products Second: $_topProductsSecond');
  }
}
