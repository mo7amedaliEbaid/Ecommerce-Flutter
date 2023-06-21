import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';

import '../widgets/mainscreenwidgets/loadedmainscreen.dart';
import '../widgets/mainscreenwidgets/myappBar.dart';



class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: MyAppBar(),
        body: LoadedMain()
        );
  }
}
