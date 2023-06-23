import 'package:flutter/material.dart';

Widget StarDisplay(int value) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: List.generate(5, (index) {
      return Icon(
        index < value ? Icons.star : Icons.star_border,
      );
    }),
  );
}
