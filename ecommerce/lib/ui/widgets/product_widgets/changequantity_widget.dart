import 'package:flutter/material.dart';
import 'package:myfirst_app/models/products_model.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_constants.dart';

Widget buildqty(BuildContext context, Product product) {
  return Consumer<CartProvider>(builder: (context, data, _) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal:14,vertical: 2),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        InkWell(
          onTap: () {
            data.decreaseQtyOfItemInCart(product);
          },
          child: Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scafoldBackground,
            ),
            child: Center(
                child: Text(
              "-",
              style: titleStyle.copyWith(fontSize: 25),
            )),
          ),
        ),
        horizontal_space,
        Text(
          '${product.quantity}',
          style: titleStyle,
        ),
        horizontal_space,
        InkWell(
          onTap: (){
            data.increaseQtyOfItemInCart(product);
          },
          child: Container(
            width: 25,
            height: 25,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: scafoldBackground,
            ),
            child: Center(
                child: Text(
                  "+",
                  style: titleStyle.copyWith(fontSize: 22),
                )),
            ),

        ),
      ]),
    );
  });
}
