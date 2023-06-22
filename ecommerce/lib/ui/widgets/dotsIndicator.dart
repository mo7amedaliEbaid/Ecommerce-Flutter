import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
class MyDotsIndicator extends StatelessWidget {
  const MyDotsIndicator({Key? key, required this.dotsindex}) : super(key: key);
final int? dotsindex;
  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: dotsindex!,
      decorator:  DotsDecorator(
        color: Colors.white,
        activeColor: Colors.black
      ),
    );
  }
}
