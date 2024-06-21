import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyArRSKVTR_KU3BM-X3I8KV_OtWNpNdJGCw');
    final response = await http.post(
      url,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    debugPrint(jsonDecode(response.body).toString());
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
  }
}
