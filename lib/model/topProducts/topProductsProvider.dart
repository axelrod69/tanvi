import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TopProductsProvider with ChangeNotifier {
  String baseUrl = 'http://34.100.212.22/';
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

    for (i = 0; i < firstResponse['data'].length; i++) {
      if (i == 0) {
        _topProductsFirst = [];
        _topProductsSecond = [];
      }

      if (i < firstResponse['data'].length / 2) {
        _topProductsFirst.add(firstResponse['data'][i]);
      } else {
        _topProductsSecond.add(firstResponse['data'][i]);
      }
    }

    print('Top Products First: $_topProductsFirst');
    print('Top Products Second: $_topProductsSecond');
  }
}
