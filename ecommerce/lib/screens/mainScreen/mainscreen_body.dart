import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';
import 'package:provider/provider.dart';

import '../../providers/product_provider.dart';
import '../search/searchscreen.dart';
import 'mainscreenwidgets/loadedmainscreen.dart';
import 'mainscreenwidgets/myappBar.dart';
import 'mainscreenwidgets/mybottomnavBar.dart';

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
