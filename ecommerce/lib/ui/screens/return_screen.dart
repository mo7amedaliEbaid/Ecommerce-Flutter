import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';

import '../../constants/global_constants.dart';
class ReturnScreen extends StatelessWidget {
  const ReturnScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Return Policies",style: titleStyle,),
        leading: InkWell(
          onTap: (){
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
          child: Text(AppConstants.lorem_text,
          style: titleStyle,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
