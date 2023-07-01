import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/ui/screens/user_screens/cart_screen.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/cartbadge_widget.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/favbadge_widget.dart';
import 'package:provider/provider.dart';
import '../../../services/localization.dart';
import '../../../providers/product_provider.dart';
import '../../screens/user_screens/favourites_screen.dart';
import '../../screens/user_screens/searchscreen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size(400, 200);

  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.267,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child:buildfav_badge()
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 25, 10, 0),
                    height: size.height*.11,
                    width: size.width*.26,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('${AppConstants.appbar_image}'),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("title")
                        .toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              buildcart_badge()
            ],
          ),
          vertical_space,
          Consumer<ProductProvider>(builder: (context, data, child) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                margin: EdgeInsets.symmetric(horizontal: 15),
                // width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("search")
                          .toString(), //'Search',
                      style: hintStyle,
                    ),
                    Icon(Icons.search),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
