import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';
import 'package:myfirst_app/providers/favourited_provider.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../localization/localization.dart';
import '../../../providers/product_provider.dart';
import '../../screens/cartscreen.dart';
import '../../screens/favouriteScreen.dart';
import '../../screens/searchscreen.dart';


class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  MyAppBar({Key? key}) : super(key: key);

  @override
  State<MyAppBar> createState() => _MyAppBarState();

  @override
  Size get preferredSize => Size(400, 190);
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.28,
      width: 400,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                child: Consumer<FavouritesProvider>(
                    builder: (context, data, child) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => FavouritePge(
                              favouritelistProduct:
                                  data.favouritelistProduct)));
                    },
                    child: Icon(
                      Icons.add_alert_sharp,
                      color: Colors.grey.shade700,
                    ),
                  );
                }),
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
                    height: 70,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('images/store2.png'),
                            fit: BoxFit.fill)),
                  ),
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("title")
                        .toString(),
                    // 'Ebaid Store',
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
                            builder: (BuildContext context) =>
                                CartPage(listProduct: data.cartlistProduct)));
                      },
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.grey.shade700,
                      )),
                );
              }),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Consumer<ProductProvider>(builder: (context, data, child) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                // width: 400,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("search")
                          .toString(), //'Search',
                      style: hintStyle,
                    ),
                    SizedBox(
                      width: 260,
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
