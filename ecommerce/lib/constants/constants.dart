import 'package:flutter/material.dart';
import '../screens/user_screens/account_screen.dart';
import '../screens/user_screens/branches.dart';
import '../screens/productsbycategory/categoriesScr.dart';
import '../screens/user_screens/settings.dart';
import '../screens/mainScreen/mainscreen_body.dart';
class CustomConstants {
  static const String PRICE_LOW_TO_HIGH = "Price: Low to High";
  static const String PRICE_HIGH_TO_LOW = "Price: High to Low";
  static const String ALPHABET_LOW_TO_HIGH = "A - Z";
  static const String ALPHABET_HIGHT_TO_LOW = "Z - A";
  final List<String> currencies = [
    'Dollars',
    'Pounds',
    'Yen',
    'Lira',
  ];
  final List<String> countries = [
    'Kuwait',
    'Egypt',
    'Emirates',
  ];
  String? selectedValue;
  String? secselectedValue;
  final List<Widget> bottomBarPages = [
    CategoryScr(),
    BranchesScreen(),
    MainScreen(),
    AccountScreen(),
    Settings(),
  ];
  final List<String> assets=[
    "images/electronic.jpeg",
     "images/jewelery.jpg",
    "images/mensCloth.jpg",
    "images/womenCloth.jpg"
  ];

}


