import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/models/popUp_model.dart';

import '../../../services/localization.dart';
import '../../widgets/app_widgets/mypopUp_widget.dart';

class ForgotpassScreen extends StatelessWidget {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//  TextEditingController emailController = TextEditingController();

  ontapsend(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).push(DismissibleDialog<void>(
          popUpFields: new PopUpFields(
              "Password Sent",
              "A reset password link has been sent to you, Please check your account !",
              false,
              true)));
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: scafoldBackground,
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
                          image: AssetImage(AppConstants.appbar_image),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Container(
                    width: size.width * .7,
                    child: Column(
                      children: [
                        vertical_space,
                        Text(
                          'Forgot Password'.toUpperCase(),
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        vertical_space,
                        AutoSizeText(
                            'Please Enter your email address which you registered here !',
                            style: Theme.of(context).textTheme.titleSmall,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * .07,
                  ),
                  TextFormField(
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalization.of(context)
                            .getTranslatedValue("emailvalidate")
                            .toString();
                      }
                      return null;
                    },
                    onTapOutside: (event) => FocusScope.of(context).unfocus(),
                    controller: emailController,
                    decoration: InputDecoration(
                        errorStyle: errorstyle,
                        iconColor: Colors.grey,
                        prefixIcon: Icon(Icons.email_outlined),
                        filled: true,
                        fillColor: Colors.white,
                        border: InputBorder.none,
                        hintText: 'Email Address'),
                  ),
                  SizedBox(
                    height: size.height * .03,
                  ),
                  InkWell(
                    onTap: () {
                      ontapsend(context);
                    },
                    child: Container(
                      height: size.height * .065,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text('Send'.toUpperCase(), style: boldWhite),
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
