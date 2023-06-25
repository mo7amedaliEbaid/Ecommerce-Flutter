import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myfirst_app/constants/api_constansts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/global_constants.dart';
import '../ui/screens/forgetpassword_screen.dart';
import '../ui/widgets/myDialog.dart';

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
        prefs.setString('pass', password);
        print(email);
        navigatorKey.currentState!.push(DismissibleDialog<void>(
            over: new Over("Successfully Registered!","You are successfully registered",true)
        ));

      } else {
        print('failed');
        navigatorKey.currentState!.pushNamed('/register');
      }
    } catch (e) {
      print(e.toString());
    }
    //  throw Exception('error');
  }

  Future<bool> login(String email, password) async {
    try {
      Response response = await post(
          Uri.parse('${Apiconstants.BASE_URL}${Apiconstants.AUTH}'),
          body: {
            'email': "$email",
            //   'username': "$username",
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
  bool _isLoading = false;
  void _changeLoading() {
  //  setState(() {
      _isLoading = !_isLoading;
  //  });
  }
  gofromregister(BuildContext context)
  {
    _changeLoading();
    if (registerformKey.currentState!.validate()) {
     register(usernameController.text.toString(),
          emailController.text.toString(),
          passwordController.text.toString());
      /*?
            Navigator.of(context).push(DismissibleDialog<void>(
                over: new Over("Successfully Registered!","You are successfully registered",true)
            ))
            : Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => CategoryScr()));*/
      _changeLoading();
    }
  }
}
/*
email:'John@gmail.com',
username:'johnd',
password:'m38rmF$',*/
