import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Network with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';

  dynamic signUp(data, url) async {
    final fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
  }
}
