import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
Widget MyDotsIndicator(int? dotsindex){
  return DotsIndicator(
    dotsCount: 3,
    position: dotsindex!,
    decorator:  DotsDecorator(
        color: Colors.white,
        activeColor: Colors.black
    ),
  );
}

