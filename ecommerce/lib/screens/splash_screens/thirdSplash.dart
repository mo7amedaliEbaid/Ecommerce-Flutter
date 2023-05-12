import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';
import 'package:myfirst_app/screens/splash_screens/splashDetailsBody.dart';

class ThirdSplash extends StatelessWidget {
  const ThirdSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackground,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg'),
                  fit: BoxFit.contain),
            ),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => SplashDetailsScreen()));
                },
                child: Text('Skip', style: boldWhite),
                style: blackWithsize,
              ))
        ],
      ),
    );
  }
}
