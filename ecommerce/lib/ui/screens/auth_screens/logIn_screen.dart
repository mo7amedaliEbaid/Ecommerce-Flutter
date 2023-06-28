import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/ui/screens/auth_screens/register_screen.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/myseparator_widget.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_constants.dart';
import '../../../services/localization.dart';
import '../../../providers/auth_provider.dart';
import 'forgetpassword_screen.dart';

class LoginScreen extends StatelessWidget{
  final GlobalKey<FormState> _loginformKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<AuthProvider>(builder: (context,authdata,_){
      return Scaffold(
        backgroundColor: scafoldBackground,
        body: Form(
          key: _loginformKey,
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
                            image: AssetImage('${AppConstants.appbar_image}'),
                            fit: BoxFit.contain),
                      ),
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        children: [
                          Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("sign")
                                .toString(),
                            style: bigStyle,
                          ),
                          vertical_space,
                          Text(AppLocalization.of(context)
                              .getTranslatedValue("loginplease")
                              .toString(),
                              style: lightStyle, textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    vertical_space,
                    vertical_space,
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null||value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("name_validate")
                              .toString();
                        }
                        return null;
                      },
                      controller: usernameController,
                      decoration: InputDecoration(
                          errorStyle:errorstyle,
                          iconColor: Colors.grey,
                          prefixIcon: Icon(Icons.nest_cam_wired_stand),
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("uname")
                              .toString()),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      validator: (String? value) {
                        if (value == null||value.isEmpty) {
                          return AppLocalization.of(context)
                              .getTranslatedValue("pass_validate")
                              .toString();
                        }
                        return null;
                      },
                      controller: passwordController,
                      decoration: InputDecoration(
                          errorStyle: errorstyle,
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          prefixIcon: Icon(Icons.lock),
                          iconColor: Colors.grey,
                          hintText: AppLocalization.of(context)
                              .getTranslatedValue("pass")
                              .toString(),
                          suffixIcon: IconButton(
                              onPressed: authdata.toggle,
                              icon: Icon(authdata.obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility))),
                      obscureText: authdata.obscureText,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ForgotpassScreen()));
                          },
                          style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0),
                              backgroundColor: MaterialStateProperty.all(
                                  Colors.grey.shade300)),
                          child: Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("forgotpass")
                                .toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          )),
                    ),
                    vertical_space,
                    vertical_space,
                    InkWell(
                      onTap: () {
                          authdata.gofromlogin(_loginformKey);
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
                                  .toString(),
                            style: boldWhite
                          ),
                        ),
                      ),
                    ),
                    vertical_space,
                    vertical_space,
                    MySeparator(context),
                    vertical_space,
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
                            AppLocalization.of(context)
                                .getTranslatedValue("create")
                                .toString().toUpperCase(),
                            style: boldWhite
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
    });

  }
}
