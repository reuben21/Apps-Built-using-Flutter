import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import './Database.dart';
import 'package:shop/models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;
  Timer _authTimer;



  bool get isAuth {

    print(token != null);
    return token != null;
  }

  String get userId {
    return _userId;
  }

  String get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  var apiKey = "AIzaSyCQffLim4mxINXHQzuEnIHaB4bFoKJN9rs";

  Future<void> _authenticate(
      String email, String password, Uri urlSegment) async {
    try {
      final response = await http.post(urlSegment,
          body: json.encode({
            'email': email,
            'password': password,
            'returnSecureToken': true
          }));
      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _expiryDate = DateTime.now()
          .add(Duration(seconds: int.parse(responseData['expiresIn'])));
      _autoLogout();

      var dbResponse = await DBProvider.db.newUserSession(_userId, _token, _expiryDate.toIso8601String());


      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // final userData = json.encode({'token':_token,'userId':_userId,'expiryDate':_expiryDate.toIso8601String()});
      // prefs.setString('userData',userData);
      // print(userData.toString());
      notifyListeners();

    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String email, String password) async {
    var url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=" +
            apiKey);
    return _authenticate(email, password, url);
  }

  Future<void> signin(String email, String password) async {
    var url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=" +
            apiKey);
    return _authenticate(email, password, url);
  }
  
  Future<bool> tryAutoLogin() async {
    var userSession = await DBProvider.db.getUserSession;
    print("USER SESSION");
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // if(prefs.containsKey('userData')) {
    //   return false;
    // }
    // print("Entered Extraction");

    final expiryDate = DateTime.parse(userSession['expiryDate']);
    if(expiryDate.isBefore(DateTime.now())) {
      return false;
    }
    _token = userSession['token'];
    _userId = userSession['userId'];
    _expiryDate = expiryDate;
    notifyListeners();
    _autoLogout();
    return true;
  }

  Future<void> logout() async {
    _token = null;
    _userId = null;
    _expiryDate = null;
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // // prefs.remove('userData');
    // final extractedUserData = json.decode(prefs.getString('userData')) as Map<String,Object>;
    // final expiryDate = DateTime.parse(extractedUserData['expiryDate']);
    // print(expiryDate.toString());
    // prefs.clear();
    notifyListeners();
    if(_authTimer!=null) {
      _authTimer.cancel();
      _authTimer = null;
    }
  }

  void _autoLogout() {
    if(_authTimer!=null) {
      _authTimer.cancel();
    }
    final timeToExpiry = _expiryDate.difference(DateTime.now()).inSeconds;
    _authTimer = Timer(Duration(seconds: timeToExpiry),logout);

  }
}
