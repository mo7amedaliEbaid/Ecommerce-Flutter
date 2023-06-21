import 'package:flutter/material.dart';

import '../screens/forgetpassword.dart';
import '../screens/logInScreeen.dart';
import 'mybottomnavbar_widget.dart';

class DismissibleDialog<T> extends PopupRoute<T> {
  final Over over;
  DismissibleDialog({required this.over});

  @override
  Color? get barrierColor => Colors.black.withAlpha(0x60);

  // This allows the popup to be dismissed by tapping the scrim or by pressing
  // the escape key on the keyboard.
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
            height: MediaQuery.of(context).size.height * .5,
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.check_circle,
                  size: 70,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(over.headline,
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 20),
                Text(
                  over.subline,
                  style: Theme.of(context).textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 45),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(100, 50)),
                  ),
                  onPressed: () {
                    if (over.navtomain == true) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyBottombar()));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    }
                  },
                  child: Text(
                    'ok',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
