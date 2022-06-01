import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ProfileProvider with ChangeNotifier {
  String baseUrl = 'http://192.168.0.154:3000/';
  Map<String, dynamic> _profile = {};

  Map<String, dynamic> get profile {
    return {..._profile};
  }

  Future<void> getProfileDetails() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');
    final response = await http.get(url, headers: {
      'Authorization': 'Bearer ${localStorage.getString('token')}',
      'Content-Type': 'application/json'
    });
    _profile = json.decode(response.body);
    print('Profile Details: $_profile');
  }

  Future<dynamic> postProfileUpdate(
      File? image, String? email, String? mobile) async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    final url = Uri.parse(baseUrl + 'api/customer/my-details/');

    var formData = FormData.fromMap({
      'profile_pic': await MultipartFile.fromFile(image!.path),
      'email': email,
      'mobile': mobile
    });

    print('Form Data: $formData');

    final response = await Dio().post(
        'http://192.168.0.154:3000/api/customer/my-details/',
        data: formData,
        options: Options(headers: {
          'Authorization': 'Bearer ${localStorage.getString('token')}'
        }));

    return response;
  }
}
