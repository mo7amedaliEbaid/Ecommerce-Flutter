import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_constants.dart';
import '../../../providers/cart_provider.dart';
import '../../../services/localization.dart';
import '../../screens/user_screens/cart_screen.dart';
buildTitle(BuildContext context) {
  return Consumer<CartProvider>(
    builder: (context, data, _) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("cart")
                  .toString(),
              style: titleStyle,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${data.cartlist.length} products".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: lightStyle
                ),
                Row(
                  children: [
                    Text(
                      "This is Gift",
                      style: lightStyle,
                    ),
                    horizontal_space,
                    Container(
                      color: Colors.white,
                      width: 25,
                      height: 25,
                      child: Icon(
                        Icons.check,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    },
  );
}