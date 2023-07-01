import 'package:flutter/material.dart';
import 'package:myfirst_app/ui/screens/auth_screens/forgetpassword_screen.dart';

import '../ui/screens/store_screens/branches_screen.dart';
import '../ui/screens/user_screens/account_screen.dart';
import '../ui/screens/store_screens/categories_screen.dart';
import '../ui/screens/app_screens/home_screen.dart';
import '../ui/screens/app_screens/settings_screen.dart';

class AppConstants {
  static String bottombar_route='/nav';
static String register_route='/register';
static String onboard_route='/onboarding';
static String home_route='/home';
static String details_route='/productdetails';
  static final splashname="/splash";
static String notificationdetails='/details';
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
  static const String gmail_link = "https://www.google.com/gmail/about/";
  static const String ad_img = "assets/images/ad.jpg";
  static const String ENGLISH = "en";
  static const String Arabic = "ar";
  static const String pageviewimage = "assets/images/splashstore.jpg";
  static const SCALE_FRACTION = 0.7;
  static const FULL_SCALE = 1.0;
  static const PAGER_HEIGHT = 220.0;
  static final List<String> currencies = [
    'Dollars',
    'Pounds',
    'Yen',
    'Lira',
    'KWD',
  ];
  static final List<String> countries = [
    'Kuwait',
    'Egypt',
    'Emirates',
  ];
  static const String offline_text =
      "Please check your Wi-Fi or data connection and click on Try Again.";
  static String? selectedValue;
  static String? secselectedValue;
  final List<Widget> bottomBarPages = [
    CategoriesScreen(),
    BranchesScreen(),
    HomeScreen(),
    AccountScreen(),
    SettingScreen(),
  ];
  static const String appbar_image = "assets/images/store2.png";
  static const String emptycart = "assets/images/emptycart.png";
  static const String splash_image = "assets/images/store3.jpg";
  static const String error_image = "assets/images/myStore.jpeg";
  static const String noconnection_image = "assets/images/noconnection.png";
  static const List<String> assets = [
    "assets/images/electronic.jpeg",
    "assets/images/jewelery.jpg",
    "assets/images/mensCloth.jpg",
    "assets/images/womenCloth.jpg"
  ];
  static const lorem_text = "Lorem ipsum dolor sit amet,"
      " consectetur adipiscing elit. Proin a commodo tortor."
      " Nam eget porta nibh. Fusce quis dolor augue. "
      "Duis lacinia augue rhoncus ante tristique pulvinar."
      " Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit."
      " Proin a Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit. Proin a "
      "commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. "
      "Duis lacinia augue rhoncus ante tristique pulvinar. "
      "Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit. "
      "Proin a Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      " Proin a commodo tortor. Nam eget porta nibh. Fusce quis dolor augue. "
      "Duis lacinia augue rhoncus ante tristique pulvinar. Lorem ipsum dolor sit amet,"
      " consectetur adipiscing elit. Proin a Lorem ipsum dolor sit amet, "
      "consectetur adipiscing elit. Proin a commodo tortor."
      " Nam eget porta nibh. Fusce quis dolor augue. "
      "Duis lacinia augue rhoncus ante tristique pulvinar."
      " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin a";
}
