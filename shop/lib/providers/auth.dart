import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  var apiKey = "AIzaSyCQffLim4mxINXHQzuEnIHaB4bFoKJN9rs";

  Future<void> _authenticate(String email,String password,Uri urlSegment) async {
    final response = await http.post(urlSegment,body: json.encode({
      'email':email,
      'password':password,
      'returnSecureToken':true
    }));
    print(json.decode(response.body));
  }

  Future<void> signup(String email,String password) async {

    var url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signUp?key="+apiKey);
    return _authenticate(email,password,url);

  }

  Future<void> signin(String email,String password) async {

    var url = Uri.parse("https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key="+apiKey);
    return _authenticate(email,password,url);

  }
}