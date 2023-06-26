import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/ui/widgets/myseparator_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../localization/localization.dart';
import '../../providers/auth_provider.dart';
import 'logIn_screen.dart';

class RegisterScreen extends StatelessWidget {
  final GlobalKey<FormState> _registerformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: scafoldBackground,
      body: Consumer<AuthProvider>(builder: (context, authdata, _) {
        return Form(
          key: _registerformKey,
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
                            image: AssetImage(AppConstants.appbar_image),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("register")
                                .toString()
                                .toUpperCase(),
                            style: bigStyle,
                          ),
                          vertical_space,
                          Text(
                              AppLocalization.of(context)
                                  .getTranslatedValue("createaccount")
                                  .toString(),
                              style: lightStyle,
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("fnamevalidate")
                              .toString();
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration: InputDecoration(
                          errorStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          iconColor: Colors.grey,
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("fname")
                              .toString(),
                          hintStyle: hintStyle),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("lnamevalidate")
                              .toString();
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                          errorStyle: errorstyle,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.person, color: Colors.grey),
                          iconColor: Colors.grey,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("lname")
                              .toString(),
                          hintStyle: hintStyle),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("emailvalidate")
                              .toString();
                        }
                        return null;
                      },
                      controller: emailController,
                      decoration: InputDecoration(
                          errorStyle: errorstyle,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.email_outlined, color: Colors.grey),
                          iconColor: Colors.grey,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("email")
                              .toString(),
                          hintStyle: hintStyle),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("pass_validate")
                              .toString();
                        }
                        return null;
                      },
                      obscureText: authdata.obscureText,
                      decoration: InputDecoration(
                          errorStyle: errorstyle,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                              onPressed: authdata.toggle,
                              icon: Icon(
                                  authdata.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey)),
                          iconColor: Colors.grey,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("pass")
                              .toString(),
                          hintStyle: hintStyle),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("pass_validate")
                              .toString();
                        }
                        return null;
                      },
                      obscureText: authdata.obscureText,
                      controller: passwordController,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          errorStyle: errorstyle,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock, color: Colors.grey),
                          suffixIcon: IconButton(
                              onPressed: authdata.toggle,
                              icon: Icon(
                                  authdata.obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey)),
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("confirm")
                              .toString(),
                          hintStyle: hintStyle),
                    ),
                    vertical_space,
                    vertical_space,
                    GestureDetector(
                      onTap: () {
                        authdata.gofromregister(_registerformKey);
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                              AppLocalization.of(context)
                                  .getTranslatedValue("create")
                                  .toString()
                                  .toUpperCase(),
                              style: boldWhite),
                        ),
                      ),
                    ),
                    vertical_space,
                    MySeparator(context),
                    vertical_space,
                    vertical_space,
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                          child: Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("login")
                                .toString()
                                .toUpperCase(),
                            style: boldWhite,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
