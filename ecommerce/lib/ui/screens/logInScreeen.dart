import 'package:flutter/material.dart';
import 'package:myfirst_app/ui/screens/register_screen.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../providers/auth_provider.dart';
import 'forgetpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthProvider postDataProvider;
  bool _obscureText = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _secformKey = GlobalKey<FormState>();

  @override
  void initState() {
    postDataProvider = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  ontapLogin() {
    setState(() {
      if (_secformKey.currentState!.validate()) {
        postDataProvider.login(emailController.text.toString(),
            passwordController.text.toString());
      }
    });
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _secformKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
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
                          'SIGN IN',
                          style: bigStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Please Login into your Account',
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
                        return 'Please Enter Your Required UserName';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Required Password';
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        iconColor: Colors.grey,
                        prefixIcon: Icon(Icons.nest_cam_wired_stand),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'UserName'),
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
                    controller: passwordController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.lock),
                        iconColor: Colors.grey,
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: _toggle,
                            icon: Icon(_obscureText
                                ? Icons.visibility_off
                                : Icons.visibility))),
                    obscureText: _obscureText,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ForgetPassScr()));
                        },
                        style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.grey.shade300)),
                        child: Text(
                          'Forgot Password?',
                          style: Theme.of(context).textTheme.subtitle1,
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        ontapLogin();
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
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
