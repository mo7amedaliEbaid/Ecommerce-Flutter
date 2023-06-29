import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_constants.dart';
import '../../../main.dart';
import '../../../providers/notifications_provider.dart';
import '../../../services/localization.dart';
import '../../../models/language_model.dart';
import '../../../providers/locale_provider.dart';
import '../../../providers/product_provider.dart';
import '../../widgets/app_widgets/mybottomnavbar_widget.dart';
import '../auth_screens/logIn_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late Notificationsprovider notificationsprovider;

  @override
  void initState() {
    super.initState();
    notificationsprovider =
        Provider.of<Notificationsprovider>(context, listen: false);
    notificationsprovider.isAndroidPermissionGranted();
    notificationsprovider.requestPermissions();
    notificationsprovider.configureDidReceiveLocalNotificationSubject(context);
    notificationsprovider.configureSelectNotificationSubject(context);
  }

  @override
  void dispose() {
    didReceiveLocalNotificationStream.close();
    selectNotificationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<LocaleCont>(builder: (context, data, child) {
      return Scaffold(
          backgroundColor: scafoldBackground,
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * .1,
                ),
                Container(
                  height: size.height * .24,
                  width: size.width * .47,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('${AppConstants.appbar_image}'),
                          fit: BoxFit.fill)),
                ),
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("title")
                      .toString(),
                  style: titleStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 28.0, horizontal: 35),
                      child: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("choose_language")
                              .toString(), //'Choose Language',
                          style: titleStyle),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        data.updateLocale(data.changeLanguage(
                            Language.languageList().first, context));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          width: size.width * .3,
                          height: size.height * .07,
                          child: Center(
                              child: Text(
                            "English",
                            style: boldWhite,
                          ))),
                    ),
                    SizedBox(
                      width: size.width * .11,
                    ),
                    InkWell(
                      onTap: () {
                        data.updateLocale(data.changeLanguage(
                            Language.languageList().last, context));
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black,
                          ),
                          width: size.width * .3,
                          height: size.height * .07,
                          child: Center(
                              child: Text(
                            "العربية",
                            style: boldWhite,
                          ))),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * .07,
                ),
                Container(
                  height: 80,
                  width: size.width * .82,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Icon(
                            Icons.attach_money_sharp,
                            size: 33,
                            color: Colors.black,
                          ),
                          horizontal_space,
                          Expanded(
                            child: AutoSizeText(
                              AppLocalization.of(context)
                                  .getTranslatedValue("select_your_currency")
                                  .toString(),
                              style: boldWhite.copyWith(color: Colors.black),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: AppConstants.currencies
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: titleStyle,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ))
                          .toList(),
                      value: AppConstants.selectedValue,
                      onChanged: (value) {
                        setState(() {
                          AppConstants.selectedValue = value as String;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: const EdgeInsets.only(left: 14, right: 14),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.black26,
                          ),
                          color: Colors.white,
                        ),
                        elevation: 0,
                      ),
                      iconStyleData: const IconStyleData(
                        icon: Icon(
                          Icons.keyboard_arrow_down_sharp,
                        ),
                        iconSize: 40,
                        iconEnabledColor: Colors.black,
                        iconDisabledColor: Colors.grey,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: size.height * .34,
                        width: size.width * .35,
                        padding: null,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Colors.white,
                        ),
                        elevation: 8,
                        offset: const Offset(-100, 70),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          thickness: MaterialStateProperty.all<double>(6),
                          thumbVisibility:
                              MaterialStateProperty.all<bool>(true),
                        ),
                      ),
                      menuItemStyleData: const MenuItemStyleData(
                        height: 40,
                        padding: EdgeInsets.only(left: 14, right: 14),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .07,
                ),
                Container(
                  width: 320,
                  height: 50,
                  child: ElevatedButton(
                    style: blackBackground,
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      var username = prefs.getString('username');
                      username == null
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginScreen()))
                          : Navigator.of(context).pushNamedAndRemoveUntil(
                              AppConstants.bottombar_route, (route) => false);
                      },
                    child: Text(
                        AppLocalization.of(context)
                            .getTranslatedValue("get_started")
                            .toString(),
                        style: whiteStyle),
                  ),
                ),
              ]));
    });
  }
}
