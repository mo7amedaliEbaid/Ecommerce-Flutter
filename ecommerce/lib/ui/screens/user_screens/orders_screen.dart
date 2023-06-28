/*
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/widgets/notification_button_widget.dart';

import '../../services/localization.dart';
class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: InkWell(
            child: Icon(Icons.arrow_back_ios,color: Colors.black,),
          ),
        ),
        title: Text(AppLocalization.of(context)
            .getTranslatedValue("orders")
            .toString(),style: boldWhite.copyWith(color: Colors.black),),
      ),
      body: LocalNotificationWidget(),
    );
  }
}
*/
