import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../models/recievednotif_model.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();
const String navigationActionId = 'id_3';




final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

//const MethodChannel platform =
    //MethodChannel('dexterx.dev/flutter_local_notifications_example');


final GlobalKey<RefreshIndicatorState> refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
TextEditingController emailController = TextEditingController();
TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();
SizedBox vertical_space = const SizedBox(
  height: 10,
);
SizedBox horizontal_space = const SizedBox(
  width: 10,
);
Color shadow_color = Color(0xffebe4d5);
Icon pressedIcon = Icon(
  Icons.favorite,
  color: Colors.red,
);
Icon unpressedIcon = Icon(Icons.favorite_border);
TextStyle titleStyle = const TextStyle(
  color: Colors.black,
  fontSize: 20,
  fontWeight: FontWeight.bold,
  overflow: TextOverflow.ellipsis,
);

TextStyle mediumStyle = const TextStyle(
    color: Colors.black, fontSize: 18, overflow: TextOverflow.ellipsis);
TextStyle whiteStyle = const TextStyle(
  color: Colors.white,
  fontSize: 23,
);
ButtonStyle blackBackground = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.black),
);
Color scafoldBackground = Color(0xffEDECE9);
ButtonStyle whiteBackground = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.white),
);
TextStyle boldWhite = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontSize: 18,
);
ButtonStyle blackWithsize = ButtonStyle(
  backgroundColor: MaterialStateProperty.all(Colors.black),
  minimumSize: MaterialStateProperty.all(Size(80, 50)),
);
TextStyle smallStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 14,
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

TextStyle errorstyle =
    TextStyle(fontWeight: FontWeight.w400, fontSize: 14, color: Colors.black);

TextStyle lightStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

TextStyle hintStyle =
    TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Colors.black);
