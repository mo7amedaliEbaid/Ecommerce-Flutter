import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/models/products_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../constants/global_constants.dart';
import '../../localization/localization.dart';
import '../../providers/cart_provider.dart';

Widget buildAddToCartButton(BuildContext context, Product product) {
  Size size = MediaQuery.sizeOf(context);
  return Consumer<CartProvider>(builder: (context, data, _) {
    Product? selectedModel = data.cartlist.firstWhereOrNull(
        (Product selectedItem) => selectedItem.id == product.id);
    if (selectedModel == null) {
      return InkWell(
        onTap: () {
          data.addItemToCart(product);
        },
        child: Container(
          width: size.width * .3,
          height: size.height * .04,
          color: Colors.black,

          child: Center(
            child: AutoSizeText(
                AppLocalization.of(context)
                    .getTranslatedValue("buy")
                    .toString(),
              style: boldWhite.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          data.removeSelectedItemFromCart(product.id!);
        },
        child: Container(
          width: size.width * .3,
          height: size.height * .04,
          color: Colors.grey.shade600,
          child: Center(
              child: AutoSizeText(
                AppLocalization.of(context)
                    .getTranslatedValue("remove")
                    .toString(),
            style: boldWhite.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          )),
        ),
      );
    }
  });
}
