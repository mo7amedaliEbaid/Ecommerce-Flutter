import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/screens/privacy_screen.dart';
import 'package:myfirst_app/ui/screens/return_screen.dart';
import 'package:myfirst_app/ui/screens/terms_screen.dart';
import 'package:provider/provider.dart';
import '../../localization/localization.dart';
import '../../providers/locale_provider.dart';
import 'contact_screen.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  static const String ENGLISH = "en";
  static const String Arabic = "ar";

  Locale _changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case ENGLISH:
        _a = Locale(language.languageCode, "US");

        break;
      case Arabic:
        _a = Locale(language.languageCode, "EG");

        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    return _a;
  }

  @override
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
                //SizedBox(width: size.width*0.4),
                Row(
                  children: [
                    Text('off'),
                    Switch(value: true, onChanged: null),
                    Text('on')
                  ],
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("language")
                      .toString(),
                  style: bigStyle,
                ),
                // SizedBox(width: size.width*0.44),
                Consumer<LocaleCont>(builder: (context, data, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: Language.languageList()
                        .map(
                          (e) => Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 1.0),
                            child: InkWell(
                              onTap: () {
                                data.updateLocale(_changeLanguage(e, context));
                                print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
                              },
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade400,
                                  ),
                                  width: 50,
                                  height: 30,
                                  child: Center(
                                      child: Text(
                                    "${e.name}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ))),
                            ),
                          ),
                        )
                        .toList(),
                  );
                }),
                /*Text('AR'),

                Text('EN')*/
              ],
            ),
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
                // SizedBox(width: size.width*0.54),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("about_ebaid_store")
                      .toString(),
                  style: bigStyle,
                ),
                //  SizedBox(width: size.width*0.46),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TermsScreen()));
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
                  //SizedBox(width: size.width*0.43),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.06),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PrivacyScreen()));
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
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ReturnScreen()));
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
            //SizedBox(height: size.height*0.02),
            Text(
              'v 1.0.0',
              style: hintStyle,
            ),
            // SizedBox(height: size.height*0.02),
          ],
        ),
      ),
    );
  }
}
