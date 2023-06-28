import 'package:flutter/material.dart';
import 'package:myfirst_app/models/popUp_model.dart';

import '../../widgets/app_widgets/mypopUp_widget.dart';

class ForgetPassScr extends StatefulWidget {
  ForgetPassScr({Key? key}) : super(key: key);

  @override
  State<ForgetPassScr> createState() => _ForgetPassScrState();
}

class _ForgetPassScrState extends State<ForgetPassScr> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  ontapsend() {
    setState(() {
      if (_formKey.currentState!.validate()) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
                    width: 250,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Forgot Password'.toUpperCase(),
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                            'Please Enter your email address which you registered here !',
                            style: Theme.of(context).textTheme.subtitle2,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null) {
                        return 'Please Enter Your Email';
                      } else if (value.isEmpty) {
                        return 'Please Enter Your Email';
                      }
                    },
                    controller: emailController,
                    decoration: InputDecoration(
                        errorStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                        iconColor: Colors.grey,
                        prefixIcon: Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Email Address'),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.of(context).push(DismissibleDialog<void>(
                            popUpFields: new PopUpFields(
                                "Password Sent",
                                "A reset password link has been sent to you, Please check your account !",
                                false,true)));
                      });
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          'Send'.toUpperCase(),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


