import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({Key? key, required this.screen_title}) : super(key: key);
  final String screen_title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          screen_title,
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
        margin: EdgeInsets.all(20),
        child: Text(
          AppConstants.lorem_text,
          style: titleStyle,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
