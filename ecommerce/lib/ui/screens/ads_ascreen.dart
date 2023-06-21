import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';

import 'onboarding_screen.dart';

class AdsScreen extends StatelessWidget {
  const AdsScreen({Key? key}) : super(key: key);

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
                      builder: (context) => OnBoardingScreen()));
                },
                child: Text('Skip', style: boldWhite),
                style: blackWithsize,
              ))
        ],
      ),
    );
  }
}
