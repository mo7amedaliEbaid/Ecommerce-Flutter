import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';

import '../../constants/global_constants.dart';

class BranchesScreen extends StatefulWidget {
  BranchesScreen({Key? key}) : super(key: key);

  @override
  State<BranchesScreen> createState() => _BranchesScreenState();
}

class _BranchesScreenState extends State<BranchesScreen> {
  bool nocountryChosen = true;
  CustomConstants constants = CustomConstants();

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
          "Branches",
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
                    padding: const EdgeInsets.all(10.0),
                    child: const Text(
                      "Country",
                      style: TextStyle(
                          fontSize: 21, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: size.width * .04),
                    height: size.height * .08,
                    width: size.width * .88,
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                        isExpanded: true,
                        hint: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                'Select Your country',
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
                        items: constants.countries
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
                        value: constants.secselectedValue,
                        onChanged: (value) {
                          setState(() {
                            constants.secselectedValue = value as String;
                            if (constants.secselectedValue == 'Kuwait' ||
                                constants.secselectedValue == 'Egypt') {
                              nocountryChosen = false;
                            } else {
                              nocountryChosen = true;
                            }
                          });
                        },
                        buttonStyleData: ButtonStyleData(
                          height: 150,
                          width: 100,
                          padding:
                              const EdgeInsets.only(left: 14, right: 14),
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
                          maxHeight: 200,
                          width: 200,
                          padding: null,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Colors.white,
                          ),
                          elevation: 2,
                          offset: const Offset(150, 0),
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
                  const SizedBox(
                    height: 10,
                  ),
                  buildListbranches(context),
                 // buildListbranches(context),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  buildListbranches(BuildContext context) {
    return nocountryChosen
        ? Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 120,
                ),
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.black),
                  child: Icon(
                    Icons.location_on,
                    size: 52,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "No Branches here",
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
                  height: 270,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          'Area name',
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "Lorem Ipsum is simply dummy text of the printing",
                          // "test",
                          style:smallStyle,
                        ),
                      ),SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.phone,color: Colors.black,size: 35,),
                          SizedBox(
                            width: 25,
                          ),
                          Text("25648651",style: titleStyle,)
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Icon(Icons.alarm,color: Colors.black,size: 35,),
                          SizedBox(
                            width: 25,
                          ),
                          Text("Sun to Mon",style: titleStyle,),

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 45,
                          ),
                          Text("10:00 AM - 8:00 PM",style: titleStyle,),
                        ],
                      )
                    ],
                  ),
                );
  }
}
