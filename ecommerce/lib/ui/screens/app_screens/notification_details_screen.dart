import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';

import '../../../constants/app_constants.dart';
import '../../../services/localization.dart';

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
  Widget build(BuildContext context) {
    Size size=MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 1,
        title: Text(
          'Notification',
          style: titleStyle,
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(0, 25, 0, 0),
              height: size.height*.3,
              width: size.width*.5,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('${AppConstants.appbar_image}'),
                      fit: BoxFit.fill)),
            ),
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("title")
                  .toString(),
              style:titleStyle
            ),
            SizedBox(
              height: size.height*.1,
            ),
            Container(
                height: size.height* .2,
                width: size.width * .8,
                child: AutoSizeText(
                  '${_payload ?? ''}',
                  textAlign: TextAlign.center,
                  style: mediumStyle,
                  maxLines: 4,
                )),
            ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
