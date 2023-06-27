import 'package:flutter/material.dart';
class NotificationDetail extends StatefulWidget {
  const NotificationDetail(
      this.payload, {
        Key? key,
      }) : super(key: key);
  final String? payload;

  @override
  State<StatefulWidget> createState() => NotificationDetailState();
}
class NotificationDetailState extends State<NotificationDetail> {
  String? _payload;

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Second Screen'),
    ),
    body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('payload ${_payload ?? ''}'),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      ),
    ),
  );
}
