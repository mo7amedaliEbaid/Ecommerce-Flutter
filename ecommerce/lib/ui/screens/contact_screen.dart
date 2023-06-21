import 'package:flutter/material.dart';
import '../../constants/globalConsts.dart';
import '../widgets/dialog.dart';

class ContactScreen extends StatefulWidget {
  ContactScreen({Key? key}) : super(key: key);

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  go() {
    Navigator.of(context).push(DismissibleDialog2<void>(
           ));
  }
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
          "Contact Us",
          style: titleStyle,
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Container(
        child: ListView(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: size.height * 0.09),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: size.width * 0.44,
                    height: size.height * 0.24,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.028),
                        Icon(
                          Icons.email_outlined,
                          size: 45,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Email Address",
                          style: hintStyle,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "user@atyabalmarshoud.kw",
                          style: smallStyle,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.05),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: size.width * 0.44,
                    height: size.height * 0.24,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.028),
                        Icon(
                          Icons.phone,
                          size: 45,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Phone",
                          style: hintStyle,
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "256655677",
                          style: smallStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  'Send us a message'.toUpperCase(),
                  style: titleStyle,
                ),
              ),
              //SizedBox(height: size.height*0.02),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Name'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: TextFormField(
                  validator: (String? value) {
                    if (value == null) {
                      return 'Please Enter Your Required UserName';
                    } else if (value.isEmpty) {
                      return 'Please Enter Your Required Password';
                    }
                  },
                  decoration: InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      filled: true,
                      hintStyle: hintStyle,
                      fillColor: Colors.white,
                      border: InputBorder.none,
                      hintText: 'Phone Number'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: 200,
                  width: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.02),
                      TextField(
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: InputBorder.none,
                            hintText: 'Message',
                            hintStyle: hintStyle),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  go();
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(18, 17, 0, 100),
                  height: 60,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      'Send'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
