import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/models/popUp_model.dart';
import '../../screens/auth_screens/logIn_screen.dart';
import 'mybottomnavbar_widget.dart';

class DismissibleDialog<T> extends PopupRoute<T> {
  final PopUpFields popUpFields;

  DismissibleDialog({required this.popUpFields});

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x60);

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => 'Successfully Registered!';

  @override
  Duration get transitionDuration => const Duration(seconds: 2);

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Center(
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.bodyMedium!,
        child: UnconstrainedBox(
          child: Container(
            height: MediaQuery.of(context).size.height * .35,
            width: MediaQuery.of(context).size.width * .7,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                vertical_space,
                popUpFields.fromauth
                    ? Icon(
                        Icons.check_circle,
                        size: 70,
                      )
                    : Icon(
                        Icons.thumb_up,
                        size: 70,
                      ),
                vertical_space,
                Text(popUpFields.headline,
                    style: Theme.of(context).textTheme.labelLarge),
                vertical_space,
                Text(
                  popUpFields.subline,
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center,
                ),
                vertical_space,
                vertical_space,
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                  ),
                  onPressed: () {
                    if (popUpFields.navtomain == true) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyBottombar()));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    }
                  },
                  child: Text('ok', style: boldWhite.copyWith(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
