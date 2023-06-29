import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';

import '../../../constants/global_constants.dart';
import '../../../services/localization.dart';

class BranchesScreen extends StatefulWidget {
  BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  bool nocountryChosen = true;

  //AppConstants constants = AppConstants();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          AppLocalization.of(context).getTranslatedValue("branches").toString(),
          style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.add_alert,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("country")
                          .toString(),
                      style: titleStyle,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: size.width * .04),
                    height: size.height * .08,
                    width: size.width * .88,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            horizontal_space,
                            Expanded(
                              child: AutoSizeText(
                                AppLocalization.of(context)
                                    .getTranslatedValue("choosecountry")
                                    .toString(),
                                style: titleStyle.copyWith(fontSize: 18),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        items: AppConstants.countries
                            .map((item) => DropdownMenuItem<String>(
                                  value: item,
                                  child: Text(
                                    item,
                                    style: titleStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        value: AppConstants.secselectedValue,
                        onChanged: (value) {
                          setState(() {
                            AppConstants.secselectedValue = value as String;
                            if (AppConstants.secselectedValue == 'Kuwait' ||
                                AppConstants.secselectedValue == 'Egypt') {
                              nocountryChosen = false;
                            } else {
                              nocountryChosen = true;
                            }
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 150,
                          width: 100,
                          padding: const EdgeInsets.only(left: 14, right: 14),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: Colors.black26,
                            ),
                            color: Colors.white,
                          ),
                          elevation: 1,
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.keyboard_arrow_down_sharp,
                            size: 50,
                          ),
                          iconSize: 25,
                          iconEnabledColor: Colors.black,
                          iconDisabledColor: Colors.grey,
                        ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: size.height * .2,
                          width: size.width * .4,
                          padding: null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          elevation: 2,
                          offset: const Offset(-150, 0),
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
                  vertical_space,
                  buildListbranches(context),
                  // buildListbranches(context),
                  vertical_space,
                ]),
          ],
        ),
      ),
    );
  }

  buildListbranches(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return nocountryChosen
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * .16,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  width: size.width * .35,
                  height: size.height * .15,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(
                    Icons.location_on,
                    size: 52,
                    color: Colors.white,
                  ),
                ),
                AutoSizeText(
                  AppLocalization.of(context)
                      .getTranslatedValue("nobranch")
                      .toString(),
                  style: titleStyle,
                ),
              ],
            ),
          )
        : Container(
            margin: EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            height: size.height * .37,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: size.width * .4,
                  child: AutoSizeText(
                    'Area name',
                    maxLines: 2,
                    style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 24,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                vertical_space,
                Container(
                  child: AutoSizeText(
                    "Lorem Ipsum is simply dummy text of the printing",
                    // "test",
                    style: smallStyle,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    AutoSizeText(
                      "25648651",
                      style: titleStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.alarm,
                      color: Colors.black,
                      size: 35,
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    Text(
                      "Sun to Mon",
                      style: titleStyle,
                    ),
                  ],
                ),
                vertical_space,
                Row(
                  children: [
                    SizedBox(
                      width: 45,
                    ),
                    Text(
                      "10:00 AM - 8:00 PM",
                      style: titleStyle,
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
