import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/globalConsts.dart';

class PostDataProvider with ChangeNotifier {
  void login(String email,String password) async {
    try {
      Response response =
          (await post(Uri.parse('https://fakestoreapi.com/auth/login'), body: {
        'username': "$email",
        'password': "$password"
      })) ;
      if (response.statusCode == 200) {
       var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
       SharedPreferences prefs = await SharedPreferences.getInstance();
       prefs.setString('email', email);
       prefs.setString('pass', password);
       print(email);
        navigatorKey.currentState!.pushNamed('nav');
      } else {
        print('failed');
        navigatorKey.currentState!.pushNamed('/register');
      }
    } catch (e) {
      print(e.toString());
    }
  }
  Future<bool> register(String username, email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://fakestoreapi.com/users'), body: {
        'email': "$email",
        'username': "$username",
        'password': "$password"
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['id']);
        print('registered successfully');
        // Navigator.of(context).push(DismissibleDialog<void>());
        // navigatorKey.currentState!.pushNamed('/third');
        return true;
      } else {
        print('failed');
        // navigatorKey.currentState!.pushNamed('/register');
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('error');
  }
}
/*
email:'John@gmail.com',
username:'johnd',
password:'m38rmF$',*/
