import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import '../../../constants/global_constants.dart';
import '../../../models/popUp_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/app_widgets/mypopUp_widget.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Future<void>? _launched;

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Contact Us",
          style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      _launched = _launchInWebViewOrVC(
                          Uri.parse(AppConstants.gmail_link));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      width: size.width * 0.44,
                      height: size.height * 0.24,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.028),
                          Icon(
                            Icons.email_outlined,
                            size: 45,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            "Email Address",
                            style: hintStyle,
                          ),
                          SizedBox(height: size.height * 0.02),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: AutoSizeText(
                              "user@atyabalmarshoud.kw",
                              style: smallStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: size.width * 0.44,
                    height: size.height * 0.24,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.028),
                        Icon(
                          Icons.phone,
                          size: 45,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Phone",
                          style: hintStyle,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "256655677",
                          style: smallStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Send us a message'.toUpperCase(),
                  style: titleStyle,
                ),
              ),
              //SizedBox(height: size.height*0.02),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Phone Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      TextField(
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Message',
                            hintStyle: hintStyle),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(DismissibleDialog<void>(
                      popUpFields: new PopUpFields(
                          "Thanks",
                          "Thanks for your message!\nWe will contact you soon",
                          true,
                          false)));
                },
                child: Container(
                 margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
                 padding: EdgeInsets.symmetric(vertical: 15),
                 // height: 60,
                //  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Send'.toUpperCase(),
                      style: boldWhite
                    ),
                  ),
                ),
              ),
              vertical_space,
              vertical_space,
            ],
          ),
        ]),
      ),
    );
  }
}
