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
import 'package:myfirst_app/ui/screens/app_screens/notification_screen.dart';
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
import 'dart:io';
import 'package:flutter/cupertino.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

//  await NotificationServices().configureLocalTimeZone();

  final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
          Platform.isLinux
      ? null
      : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
  String initialRoute = AppConstants.notification_route;
  if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
    selectedNotificationPayload =
        notificationAppLaunchDetails!.notificationResponse?.payload;
    initialRoute = AppConstants.notificationdrawer_route;
  }

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('ic_launcher');

  final List<DarwinNotificationCategory> darwinNotificationCategories =
      <DarwinNotificationCategory>[
    DarwinNotificationCategory(
      darwinNotificationCategoryText,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.text(
          'text_1',
          'Action 1',
          buttonTitle: 'Send',
          placeholder: 'Placeholder',
        ),
      ],
    ),
    DarwinNotificationCategory(
      darwinNotificationCategoryPlain,
      actions: <DarwinNotificationAction>[
        DarwinNotificationAction.plain('id_1', 'Action 1'),
        DarwinNotificationAction.plain(
          'id_2',
          'Action 2 (destructive)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.destructive,
          },
        ),
        DarwinNotificationAction.plain(
          navigationActionId,
          'Action 3 (foreground)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.foreground,
          },
        ),
        DarwinNotificationAction.plain(
          'id_4',
          'Action 4 (auth required)',
          options: <DarwinNotificationActionOption>{
            DarwinNotificationActionOption.authenticationRequired,
          },
        ),
      ],
      options: <DarwinNotificationCategoryOption>{
        DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
      },
    )
  ];
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
    notificationCategories: darwinNotificationCategories,
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
    onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
  );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => FavouritesProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => LocaleCont()),
        ChangeNotifierProvider(create: (_) => Notificationsprovider()),
      ],
      child: MyApp(
        notificationAppLaunchDetails: notificationAppLaunchDetails,
      )));
}

@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, this.notificationAppLaunchDetails}) : super(key: key);
  ProductProvider productProvider = ProductProvider();
  AppConstants customConstants = AppConstants();
  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

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
          AppConstants.bottombar_route: (context) => MyBottombar(),
          AppConstants.register_route: (context) => RegisterScreen(),
          AppConstants.onboard_route: (context) => OnBoardingScreen(),
          AppConstants.notification_route: (_) =>
              NotificationsScreen(/*notificationAppLaunchDetails*/),
          AppConstants.notificationdrawer_route: (_) =>
              NotificationDetail(selectedNotificationPayload)
        },
        home: SplashScreen(),
      );
    });
  }
}
/*final NotificationAppLaunchDetails? notificationAppLaunchDetails = !kIsWeb &&
    Platform.isLinux
    ? null
    : await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();*/
