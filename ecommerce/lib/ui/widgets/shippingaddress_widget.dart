import 'package:flutter/material.dart';

import '../../constants/global_constants.dart';

Widget ShippingAdress() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text('Shipping Address'.toUpperCase(), style: titleStyle),
      ),
      vertical_space,
      Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Home',
              style: titleStyle,
            ),
            vertical_space,
            Text(
                "Kuwait, Salmiya \n +96551352757 \nAddress Line 1 \nAddress line 2 \n110002 \n Near Al Rashid",
                style: lightStyle),
          ],
        ),
      ),
      vertical_space,
      vertical_space
    ],
  );
}
