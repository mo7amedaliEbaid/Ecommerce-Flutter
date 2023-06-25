import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../providers/auth_provider.dart';
import '../widgets/myDialog.dart';
import 'categories_screen.dart';
import 'forgetpassword_screen.dart';
import 'logIn_screen.dart';
class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isLoading = false;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late AuthProvider authprovider;
  bool _obscureText = true;
  @override
  void initState() {
    authprovider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  go()
     {
      _changeLoading();
      if (_formKey.currentState!.validate()) {
         authprovider.register(usernameController.text.toString(),
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


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  Container(
                    margin: EdgeInsets.all(size.height * .02),
                    height: size.height * .20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('images/store2.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Container(
                    width: 200,
                    child: Column(
                      children: [
                        Text(
                          'Register'.toUpperCase(),
                          style: bigStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Create a New Account',
                            style: lightStyle, textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required FirstName';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required FirstName';
                      }
                    },
                    controller: usernameController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        iconColor: Colors.grey,
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'First Name*',
                        hintStyle: hintStyle),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required LastName';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required LastName';
                      }
                    },
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person,color: Colors.grey),
                        iconColor: Colors.grey,
                        hintText: 'Last Name*',
                        hintStyle: hintStyle),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required Email';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required Email';
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email_outlined,color: Colors.grey),
                        iconColor: Colors.grey,
                        hintText: 'Email Address*',
                        hintStyle: hintStyle),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required Password';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required Password';
                      }
                    },
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(_obscureText?Icons.visibility_off:Icons.visibility,color: Colors.grey)),
                        iconColor: Colors.grey,
                        hintText: 'Password*',
                        hintStyle: hintStyle),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Required Password';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required Password';
                      }
                    },
                    obscureText: _obscureText,
                    controller: passwordController,
                    cursorColor: Colors.grey,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(_obscureText?Icons.visibility_off:Icons.visibility,color: Colors.grey)),

                        hintText: 'Confirm Password*',
                        hintStyle: hintStyle),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {

                        go();


                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Create Account'.toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: size.width * 0.4,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'OR',
                        style: bigStyle,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: size.width * 0.4,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
