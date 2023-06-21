import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';

import '../../localization/localization.dart';
import '../widgets/mainscreenwidgets/myappbar_widget.dart';
import '../widgets/categories_listview_widget.dart';
import '../widgets/mainscreenwidgets/mypage_view.dart';
import '../widgets/mainscreenwidgets/secondListview.dart';
import 'allproductsScr.dart';
import 'categories_screen.dart';



class HomeScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: MyAppBar(),
        body: homebody(context)
        );
  }
}
Widget homebody(BuildContext context){
  return  ListView(
    shrinkWrap: true,
    children: [
      InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CategoriesScreen()));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 20),
          child: Text(
            AppLocalization.of(context)
                .getTranslatedValue("shop_by_category")
                .toString(),
            style: titleStyle.copyWith(
              backgroundColor: shadow_color
            ),
          ),
        ),
      ),
      categories_listview(context),
      MyPageView(),
      SizedBox(height: 20,),
      Container(
        color: Colors.transparent,
        margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(AppLocalization.of(context)
                  .getTranslatedValue("featured_products")
                  .toString(),
                  style: titleStyle
              ),
            ),
            //SizedBox(width: 90,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                autofocus: false,
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(scafoldBackground)
                ),
                onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllProductsScreen()));
                },
                child: Text(AppLocalization.of(context)
                    .getTranslatedValue("view_all")
                    .toString(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),),
              ),
            ),
          ],
        ),
      ),
      SizedBox(height: 20,),
      SecondListview(),
    ],
  );
}