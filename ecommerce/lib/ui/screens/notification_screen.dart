import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myfirst_app/providers/notifications_provider.dart';
import 'package:provider/provider.dart';
import '../../constants/global_constants.dart';
import '../../models/recievednotif_model.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import '../widgets/notification_button_widget.dart';
import 'notification_details_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen(
    this.notificationAppLaunchDetails, {
    Key? key,
  }) : super(key: key);

  final NotificationAppLaunchDetails? notificationAppLaunchDetails;

  bool get didNotificationLaunchApp =>
      notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  late Notificationsprovider notificationsprovider;

  @override
  void initState() {
    super.initState();
    notificationsprovider =
        Provider.of<Notificationsprovider>(context, listen: false);

    notificationsprovider.isAndroidPermissionGranted();
    notificationsprovider.requestPermissions();
    _configureDidReceiveLocalNotificationSubject();
    _configureSelectNotificationSubject();
  }

  void _configureDidReceiveLocalNotificationSubject() {
    didReceiveLocalNotificationStream.stream
        .listen((ReceivedNotification receivedNotification) async {
      await showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: receivedNotification.title != null
              ? Text(receivedNotification.title!)
              : null,
          content: receivedNotification.body != null
              ? Text(receivedNotification.body!)
              : null,
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              onPressed: () async {
                Navigator.of(context, rootNavigator: true).pop();
                await Navigator.of(context).push(
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        NotificationDetail(receivedNotification.payload),
                  ),
                );
              },
              child: const Text('Ok'),
            )
          ],
        ),
      );
    });
  }

  void _configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => NotificationDetail(payload),
      ));
    });
  }

  @override
  void dispose() {
    didReceiveLocalNotificationStream.close();
    selectNotificationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: Consumer<Notificationsprovider>(builder: (context, notidata, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                children: <Widget>[
                  PaddedElevatedButton(
                    buttonText: 'Show plain notification with payload',
                    onPressed: () async {
                      await notidata.showNotification();
                    },
                  ),
                  PaddedElevatedButton(
                    buttonText: 'Show notification with custom sound',
                    onPressed: () async {
                      await notidata.showNotificationCustomSound();
                    },
                  ),
                  PaddedElevatedButton(
                    buttonText:
                        'Schedule monthly Monday 10:00:00 am notification in '
                        'your local time zone',
                    onPressed: () async {
                      await notidata.scheduleMonthlyMondayTenAMNotification();
                    },
                  ),
                  PaddedElevatedButton(
                    buttonText:
                        'Schedule yearly Monday 10:00:00 am notification in '
                        'your local time zone',
                    onPressed: () async {
                      await notidata.scheduleYearlyMondayTenAMNotification();
                    },
                  ),
                  PaddedElevatedButton(
                    buttonText: 'Cancel latest notification',
                    onPressed: () async {
                      await notidata.cancelNotification();
                    },
                  ),
                  PaddedElevatedButton(
                    buttonText: 'Cancel all notifications',
                    onPressed: () async {
                      await notidata.cancelAllNotifications();
                    },
                  ),
                  const Divider(),
                  if (Platform.isAndroid) ...<Widget>[
                    PaddedElevatedButton(
                      buttonText: 'Show ongoing notification',
                      onPressed: () async {
                        await notidata.showOngoingNotification();
                      },
                    ),
                    PaddedElevatedButton(
                      buttonText: 'Show notification with sound controlled by '
                          'alarm volume',
                      onPressed: () async {
                        await notidata
                            .showNotificationWithAudioAttributeAlarm();
                      },
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
      }));
}
