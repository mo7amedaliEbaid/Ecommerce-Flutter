import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/screens/store_screen.dart';
import 'package:provider/provider.dart';
import '../../localization/localization.dart';
import '../../models/language_model.dart';
import '../../providers/locale_provider.dart';
import 'contact_screen.dart';

class SettingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        centerTitle: true,
        title: Text(
          AppLocalization.of(context).getTranslatedValue("settings").toString(),
          style: mediumStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("nofications")
                      .toString(),
                  style: bigStyle,
                ),
                Row(
                  children: [
                    Text('off'),
                    Switch(value: true, onChanged: null),
                    Text('on'),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),

            Consumer<LocaleCont>(builder: (context, data, child) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("language")
                        .toString(),
                    style: bigStyle,
                  ),
                  Row(
                    children: [
                      data.isenglish ? Text("English") : Text("عربي"),
                      Switch(
                          value: data.isenglish,
                          activeTrackColor: Colors.white,
                          inactiveTrackColor: Colors.white,
                          thumbColor:
                              MaterialStatePropertyAll<Color>(Colors.black),
                          onChanged: (bool value) {
                            data.changeswitch_text();
                            data.isenglish == true
                                ? data.updateLocale(data.changeLanguage(
                                    Language.languageList().first, context))
                                : data.updateLocale(data.changeLanguage(
                                    Language.languageList().last, context));
                            value = data.isenglish;
                          }),
                    ],
                  ),
                ],
              );
            }),
            SizedBox(height: size.height * 0.04),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("currency")
                      .toString(),
                  style: bigStyle,
                ),
                Row(
                  children: [
                    Text(
                      'KWD',
                      style: bigStyle,
                    ),
                    SizedBox(width: size.width * 0.005),
                    Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.arrow_forward_ios)),
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoreScreen(
                          screen_title: AppLocalization.of(context)
                              .getTranslatedValue("about")
                              .toString(),
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("about")
                        .toString(),
                    style: bigStyle,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoreScreen(
                          screen_title: AppLocalization.of(context)
                              .getTranslatedValue("terms")
                              .toString(),
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("terms")
                        .toString(),
                    style: bigStyle,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoreScreen(
                          screen_title: AppLocalization.of(context)
                              .getTranslatedValue("privacy")
                              .toString(),
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("privacy")
                        .toString(),
                    style: bigStyle,
                  ),
                  // SizedBox(width: size.width*0.53),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => StoreScreen(
                          screen_title: AppLocalization.of(context)
                              .getTranslatedValue("return")
                              .toString(),
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("return")
                        .toString(),
                    style: bigStyle,
                  ),
                  // SizedBox(width: size.width*0.54),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("contact")
                        .toString(),
                    style: bigStyle,
                  ),
                  //SizedBox(width: size.width*0.58),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: Text(
                'v 1.0.0',
                style: hintStyle,
              ),
            ),
            // SizedBox(height: size.height*0.02),
          ],
        ),
      ),
    );
  }
}
