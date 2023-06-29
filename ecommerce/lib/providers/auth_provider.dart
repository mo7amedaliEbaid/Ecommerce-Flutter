import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:myfirst_app/constants/api_constansts.dart';
import 'package:myfirst_app/models/popUp_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_constants.dart';
import '../ui/widgets/app_widgets/mypopUp_widget.dart';

class AuthProvider with ChangeNotifier {
  void register(String username, email, password) async {
    try {
      Response response = (await post(
          Uri.parse('${Apiconstants.BASE_URL}${Apiconstants.LOGIN}'),
          body: {
            'email': "$email",
            'username': "$username",
            'password': "$password"
          }));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);
        print('Login successfully');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('email', email);
        prefs.setString('username', username);
        prefs.setString('pass', password);
        print(email);
        navigatorKey.currentState!.push(DismissibleDialog<void>(
            popUpFields: new PopUpFields("Successfully Registered!",
                "You are successfully registered", true, true)));
      } else {
        print('failed');
        null;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse('${Apiconstants.BASE_URL}${Apiconstants.AUTH}'),
          body: {'username': "$username", 'password': "$password"});
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['id']);
        print('registered successfully');
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('username', username);
        navigatorKey.currentState!.push(DismissibleDialog<void>(
            popUpFields: new PopUpFields("Successfully Logged In!",
                "You are successfully Logged In", true, true)));
      } else {
        print('failed');
        null;
      }
    } catch (e) {
      print(e.toString());
    }
    throw Exception('error');
  }

  gofromregister(GlobalKey<FormState> _registerformKey) {
    if (_registerformKey.currentState!.validate()) {
      register(usernameController.text.toString(),
          emailController.text.toString(), passwordController.text.toString());
    }
  }

  gofromlogin(GlobalKey<FormState> _loginformKey) {
    if (_loginformKey.currentState!.validate()) {
      login(usernameController.text.toString(),
          passwordController.text.toString());
    }
  }

  bool obscureText = true;

  void toggle() {
    obscureText = !obscureText;
    notifyListeners();
  }

  String? username;

  Future<String?> getusername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString("username");
    return username;
  }

  String? email;

  Future<String?> getemail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString("email");
    return email;
  }

  GetStorage box = GetStorage();

  void logout() async {
    box.erase();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
/*
email:'John@gmail.com',
username:'johnd',
password:'m38rmF$',*/
