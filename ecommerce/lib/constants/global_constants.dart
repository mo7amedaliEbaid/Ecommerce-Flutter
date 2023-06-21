import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
SizedBox vertical_space=const SizedBox(height: 10,);
SizedBox horizontal_space=const SizedBox(width: 10,);

TextStyle titleStyle = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
);
TextStyle mediumStyle = const TextStyle(
  color: Colors.black,
  fontSize: 18,
);
TextStyle whiteStyle = const TextStyle(
  color: Colors.white,
  fontSize: 23,
);
ButtonStyle blackBackground = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.black),
);
Color scafoldBackground = Colors.grey.shade300;
ButtonStyle whiteBackground = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
);
TextStyle boldWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
ButtonStyle blackWithsize=ButtonStyle(
backgroundColor: MaterialStateProperty.all(Colors.black),
minimumSize: MaterialStateProperty.all(Size(80, 50)),
);
TextStyle smallStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
);

TextStyle meduimStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 15,
);
TextStyle bigStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 17,
);
TextStyle meduimStyl = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 16,
  color: Colors.black,
);
TextStyle lightStyle = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 18,
);

TextStyle lightStyl = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

TextStyle hintStyle =
TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black);


