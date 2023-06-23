import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/global_constants.dart';
import '../../localization/localization.dart';
import '../../models/language_model.dart';
import '../../providers/locale_provider.dart';
import '../../providers/product_provider.dart';
import '../widgets/mybottomnavbar_widget.dart';
import 'logInScreeen.dart';

class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {



 // AppConstants constants = AppConstants();
  ProductProvider productProvider = ProductProvider();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<LocaleCont>(builder: (context, data, child) {
      return Scaffold(
          backgroundColor: scafoldBackground,
          body: Stack(children: [
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.1,
              child: Container(
                height: 220,
                width: 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('${AppConstants.appbar_image}'),
                        fit: BoxFit.fill)),
              ),
            ),
            Positioned(
                top: size.height * 0.36,
                left: size.width * 0.35,
                child: Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("title")
                      .toString(),
                  // 'Ebaid Store',
                  style: titleStyle,
                )),
            Positioned(
              top: size.height * 0.45,
              left: size.width * 0.12,
              child: Container(
                height: 50,
                child: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("choose_language")
                        .toString(), //'Choose Language',
                    style: titleStyle),
              ),
            ),
            Positioned(
              top: size.height * 0.53,
              left: size.width * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: Language.languageList()
                    .map(
                      (e) => Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: InkWell(
                          onTap: () {
                            data.updateLocale(data.changeLanguage(e, context));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.black,
                              ),
                              width: 125,
                              height: 50,
                              child: Center(
                                  child: Text(
                                "${e.name}",
                                style: boldWhite,
                              ))),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Positioned(
              left: size.width * 0.1,
              top: size.height * 0.66,
              child: Container(
                height: 80,
                width: 320,
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
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("select_your_currency")
                                .toString(),
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
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
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
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
                      height: 50,
                      width: 160,
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
                      maxHeight: 200,
                      width: 200,
                      padding: null,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      elevation: 8,
                      offset: const Offset(150, 0),
                      scrollbarTheme: ScrollbarThemeData(
                        radius: const Radius.circular(40),
                        thickness: MaterialStateProperty.all<double>(6),
                        thumbVisibility: MaterialStateProperty.all<bool>(true),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      height: 40,
                      padding: EdgeInsets.only(left: 14, right: 14),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: size.width * 0.1,
              top: size.height * 0.85,
              child: Container(
                width: 320,
                height: 50,
                child: ElevatedButton(
                  style: blackBackground,
                  onPressed: () async {
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    var email = prefs.getString('email');
                    print(email);
                    //runApp(MaterialApp(home: email == null ? Login() : Home()));
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            email == null ? LoginScreen() : MyBottombar()));
                  },
                  child: Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("get_started")
                          .toString(),
                      style: whiteStyle),
                ),
              ),
            ),
          ]));
    });
  }
}
