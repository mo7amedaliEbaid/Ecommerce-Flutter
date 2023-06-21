import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/providers/favourited_provider.dart';
import 'package:myfirst_app/providers/auth_provider.dart';
import 'package:myfirst_app/providers/product_provider.dart';
import 'package:myfirst_app/ui/screens/home_screen.dart';
import 'package:myfirst_app/ui/screens/onboarding_screen.dart';
import 'package:myfirst_app/ui/screens/register_screen.dart';
import 'package:myfirst_app/ui/screens/splash_screen.dart';
import 'package:myfirst_app/ui/widgets/mybottomnavbar_widget.dart';
import 'package:provider/provider.dart';
import 'constants/global_constants.dart';
import 'localization/localization.dart';
import 'providers/locale_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => FavouritesProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => LocaleCont()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  ProductProvider productProvider = ProductProvider();
  CustomConstants customConstants = CustomConstants();

  @override
  Widget build(BuildContext context) {
    return Consumer<LocaleCont>(builder: (context, data, child) {
      return MaterialApp(
        locale: data.locale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        navigatorKey: navigatorKey,
        //title: 'Ebaid Store',
        debugShowCheckedModeBanner: false,
        routes: {
          'm': (context) => HomeScreen(),
          'nav': (context) => MyBottombar(),
          '/register': (context) => RegisterScreen(),
          '/onboarding': (context) => OnBoardingScreen(),
        },
        home: SplashScreen(),
      );
    });
  }
}
