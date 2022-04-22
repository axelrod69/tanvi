import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Network with ChangeNotifier {
  String baseUrl = 'http://3.109.206.91:8000/';
  String? token;

  dynamic signUp(data, url) async {
    final fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
  }

  dynamic checkOtp(data, url) async {
    final fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
  }

  dynamic logIn(data, url) async {
    final fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
  }

  dynamic loginOtp(data, url) async {
    final fullUrl = baseUrl + url;
    return await http.post(Uri.parse(fullUrl),
        body: json.encode(data), headers: {'Content-Type': 'application/json'});
  }

  dynamic getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = localStorage.getString('token');
    print('Access Token: $token');
    return token;
  }
}
