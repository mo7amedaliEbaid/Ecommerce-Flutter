import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../models/products_model.dart';
import '../../../providers/cart_provider.dart';

buildProductCard(BuildContext context, Product product) {
  Size size = MediaQuery.sizeOf(context);
  return Consumer<CartProvider>(builder: (context, cartdata, _) {
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: size.width * .3,
              height: size.height * .15,
              child: Image.network(
                product.image!,
                fit: BoxFit.fill,
                errorBuilder: (context, error, stackTrace) => Image.asset(
                  "${AppConstants.error_image}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            horizontal_space,
            horizontal_space,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    width: size.width*.44,
                    margin: EdgeInsets.only(bottom: 5),
                    child: AutoSizeText(product.title!,
                        maxLines: 2, style: titleStyle.copyWith(fontSize: 18))),
                Text(
                  "Quantity : ${product.quantity}",
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                vertical_space,
                Text(
                  "${product.price! * product.quantity}  KWD",
                  // "test",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            horizontal_space,
            horizontal_space,
            InkWell(
              onTap: () {
                cartdata.removeSelectedItemFromCart(product.id!);
              },
              child: const Icon(
                Icons.clear,
                size: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
        vertical_space
      ],
    );
  });
}
