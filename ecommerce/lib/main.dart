import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:myfirst_app/providers/auth_provider.dart';
import 'package:myfirst_app/providers/product_provider.dart';
import 'package:myfirst_app/providers/notifications_provider.dart';
import 'package:myfirst_app/ui/screens/app_screens/notification_details_screen.dart';
import 'package:myfirst_app/ui/screens/app_screens/onboarding_screen.dart';
import 'package:myfirst_app/ui/screens/auth_screens/register_screen.dart';
import 'package:myfirst_app/ui/screens/app_screens/splash_screen.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/mybottomnavbar_widget.dart';
import 'package:provider/provider.dart';
import 'constants/global_constants.dart';
import 'models/recievednotif_model.dart';
import 'services/localization.dart';
import 'providers/locale_provider.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('launch_ic');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification:
        (int id, String? title, String? body, String? payload) async {
      didReceiveLocalNotificationStream.add(
        ReceivedNotification(
          id: id,
          title: title,
          body: body,
          payload: payload,
        ),
      );
    },
  );
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsDarwin,
  );
  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) {
      switch (notificationResponse.notificationResponseType) {
        case NotificationResponseType.selectedNotification:
          selectNotificationStream.add(notificationResponse.payload);
          break;
        case NotificationResponseType.selectedNotificationAction:
          if (notificationResponse.actionId == navigationActionId) {
            selectNotificationStream.add(notificationResponse.payload);
          }
          break;
      }
    },
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ProductProvider()),
    ChangeNotifierProvider(create: (_) => CartProvider()),
    ChangeNotifierProvider(create: (_) => FavouritesProvider()),
    ChangeNotifierProvider(create: (_) => AuthProvider()),
    ChangeNotifierProvider(create: (_) => LocaleCont()),
    ChangeNotifierProvider(create: (_) => Notificationsprovider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
  }) : super(key: key);

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
        debugShowCheckedModeBanner: false,
        routes: {
          AppConstants.bottombar_route: (context) => MyBottombar(),
          AppConstants.register_route: (context) => RegisterScreen(),
          AppConstants.onboard_route: (context) => OnBoardingScreen(),
          AppConstants.notificationdrawer_route: (_) =>
              NotificationDetail(AppConstants().selectedNotificationPayload)
        },
        home: SplashScreen(),
      );
    });
  }
}
