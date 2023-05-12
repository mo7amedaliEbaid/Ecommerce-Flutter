import 'package:flutter/material.dart';

import '../../constants/globalConsts.dart';
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
        child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. Duis lacinia augue rhoncus ante tristique pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. Duis lacinia augue rhoncus ante tristique pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. Duis lacinia augue rhoncus ante tristique pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. Duis lacinia augue rhoncus ante tristique pulvinar. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a",
          style: titleStyle,
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
