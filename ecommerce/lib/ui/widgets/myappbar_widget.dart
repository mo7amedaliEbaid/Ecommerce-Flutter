import 'package:badges/badges.dart' as badges;
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/ui/screens/cart_screen.dart';
import 'package:myfirst_app/ui/screens/notification_screen.dart';
import 'package:provider/provider.dart';

import '../../services/localization.dart';
import '../../providers/product_provider.dart';
import '../screens/favourites_screen.dart';
import '../screens/searchscreen.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size(400, 190);

  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      height: size.height * 0.24,
      //width: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: /*Consumer<FavouritesProvider>(
                    builder: (context, data, child) {
                  return */
                    InkWell(
                  onTap: () {

                   Navigator.of(context).pushNamed("/noti");
                  },
                  child: Icon(
                    Icons.add_alert_sharp,
                    color: Colors.grey.shade700,
                  ),
                ),
                // }),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    height: 70,
                    width: 100,
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
              Consumer<CartProvider>(builder: (context, data, child) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => CartScreen()));
                    },
                    icon: badges.Badge(
                      child: const Icon(
                        Icons.shopping_bag,
                        size: 30,
                        // color: Colors.grey,
                      ),
                      badgeStyle: BadgeStyle(
                        badgeColor: Colors.grey,
                      ),
                      badgeContent: Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          '${data.cartlist.length}',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
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
