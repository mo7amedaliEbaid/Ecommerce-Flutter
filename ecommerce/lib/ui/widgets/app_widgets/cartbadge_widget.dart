import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;

import '../../../providers/cart_provider.dart';
import '../../screens/user_screens/cart_screen.dart';
Widget buildcart_badge(){
  return Consumer<CartProvider>(builder: (context, data, child) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
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
  });
}