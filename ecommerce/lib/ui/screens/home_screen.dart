import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';

import '../../localization/localization.dart';
import '../widgets/myappbar_widget.dart';
import '../widgets/categories_listview_widget.dart';
import '../widgets/mypageview_widget.dart';
import '../widgets/featured_listview_widget.dart';
import 'allproducts_screen.dart';
import 'categories_screen.dart';



class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: MyAppBar(),
        body: _buildhomebody(context)
        );
  }

Widget _buildhomebody(BuildContext context){
  return  ListView(
    shrinkWrap: true,
    children: [
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppLocalization.of(context)
                    .getTranslatedValue("shop_by_category")
                    .toString(),
                style: titleStyle
              ),
              Icon(Icons.arrow_forward_ios)
            ],
          ),
        ),
      ),
      categories_listview(context),
      MyPageView(),
      vertical_space,
      vertical_space,
      FeaturedListView(),
    ],
  );
}}