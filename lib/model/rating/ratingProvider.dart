import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class RatingProvider with ChangeNotifier {
  String baseUrl = 'http://127.0.0.1:8000/';
  Map<String, dynamic> _ratings = {};

  Map<String, dynamic> get ratings {
    return {..._ratings};
  }

  Future<void> postRating(String productId, String rating) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/product-review/');

    final response = await http.post(url,
        body: json.encode({'product': productId, 'rating': rating}),
        headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}',
          'Content-Type': 'application/json'
        });

    var res = json.decode(response.body);

    print('Rating Response: $res');
  }

  Future<void> getRatings() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/product-review/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });

    if (response.statusCode == 200) {
      var res = json.decode(response.body);

      _ratings = res;

      print('Ratings $_ratings');
    } else {
      _ratings = {'data': []};
    }
  }
}
