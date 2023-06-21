import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myfirst_app/constants/constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/providers/favourited_provider.dart';
import 'package:myfirst_app/providers/postdata_Provider.dart';
import 'package:myfirst_app/providers/product_provider.dart';
import 'package:myfirst_app/ui/screens/mainscreen_body.dart';
import 'package:myfirst_app/ui/screens/regesterScr.dart';
import 'package:myfirst_app/ui/screens/splash_screen.dart';
import 'package:myfirst_app/ui/widgets/mainscreenwidgets/mybottomnavBar.dart';
import 'package:provider/provider.dart';
import 'constants/globalConsts.dart';
import 'localization/localization.dart';
import 'providers/locale_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => FavouritesProvider()),
    ChangeNotifierProvider(create: (_) => PostDataProvider()),
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
          'm': (context) => MainScreen(),
          'nav': (context) => MyBottombar(),
          '/register': (context) => RegisterScreen(),
        },
        home: SplashScreen(),
      );
    });
  }
}
