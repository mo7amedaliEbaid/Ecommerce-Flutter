import 'package:flutter/material.dart';

import '../ui/screens/account_screen.dart';
import '../ui/screens/branches.dart';
import '../ui/screens/categories_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/settings.dart';

class AppConstants {
  static const String PRICE_LOW_TO_HIGH = "Price: Low to High";
  static const String PRICE_HIGH_TO_LOW = "Price: High to Low";
  static const String ALPHABET_LOW_TO_HIGH = "A - Z";
  static const String ALPHABET_HIGHT_TO_LOW = "Z - A";
 static const List<String> sortDropdown = [
    ALPHABET_LOW_TO_HIGH,
    ALPHABET_HIGHT_TO_LOW,
    PRICE_LOW_TO_HIGH,
    PRICE_HIGH_TO_LOW,
  ];
 static const String pageviewimage="images/splashstore.jpg";
 static const SCALE_FRACTION = 0.7;
  static const FULL_SCALE = 1.0;
  static const PAGER_HEIGHT = 220.0;
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
    CategoriesScreen(),
    BranchesScreen(),
    HomeScreen(),
    AccountScreen(),
    Settings(),
  ];
  static const List<String> assets = [
    "images/electronic.jpeg",
    "images/jewelery.jpg",
    "images/mensCloth.jpg",
    "images/womenCloth.jpg"
  ];
}
