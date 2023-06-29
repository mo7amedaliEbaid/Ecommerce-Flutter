import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/auth_provider.dart';
import 'package:myfirst_app/ui/screens/store_screens/contact_screen.dart';
import 'package:myfirst_app/ui/screens/user_screens/cart_screen.dart';
import 'package:provider/provider.dart';
import '../../../constants/global_constants.dart';
import '../../../services/localization.dart';
import '../app_screens/splash_screen.dart';
import 'favourites_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late AuthProvider authProvider;
  @override
  void initState() {
    authProvider=Provider.of<AuthProvider>(context,listen: false);
    authProvider.getusername();
    authProvider.getemail();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        backgroundColor: scafoldBackground,
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "Account",
          style: titleStyle,
        ),
      ),
      body: Container(
        width: size.width * 0.92,
        height: size.height * .95,
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Container(
                      height: size.height * 0.2,
                      width: size.width * 0.92,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: size.width * 0.04),
                            child: Consumer<AuthProvider>(
                                builder: (context, authdata, _) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.07,
                                  ),
                                  Text(
                                    authdata.username ?? "",
                                    style: titleStyle,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.01,
                                  ),
                                  Container(
                                    height: size.height * 0.06,
                                    width: size.width * 0.47,
                                    child: AutoSizeText(
                                      authdata.email ?? "",
                                      style: hintStyle,
                                    ),
                                  ),
                                ],
                              );
                            })),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.09,
                    ),
                  ],
                ),
                Positioned(
                  top: size.height * .15,
                  left: size.width * 0.05,
                  child: Container(
                    width: size.width * 0.3,
                    height: size.height * .16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Colors.black,
                    ),
                    child: Icon(
                      Icons.person,
                      size: 70,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                    right: 20,
                    top: 50,
                    child: Icon(
                      Icons.edit,
                      color: Colors.grey,
                      size: 30,
                    ))
              ],
            ),
            SizedBox(height: size.height * 0.03),
            InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => FavouritesScreen()));
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                      ),
                      // SizedBox(width: size.width*0.05),
                      Text(
                        AppLocalization.of(context)
                            .getTranslatedValue("fav")
                            .toString(),
                        style: boldWhite,
                      ),
                      // SizedBox(width: size.width*0.37),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),

            SizedBox(height: size.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.shopping_bag,
                      color: Colors.white,
                    ),
                    Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("cart")
                          .toString(),
                      style: boldWhite,
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ContactScreen()));
              },
              child: Container(
                padding: EdgeInsets.all(20),
                height: size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    //  SizedBox(width: size.width*0.05),
                    Text(
                      AppLocalization.of(context)
                          .getTranslatedValue("contact")
                          .toString(),
                      style: boldWhite,
                    ),
                    // SizedBox(width: size.width*0.37),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Consumer<AuthProvider>(builder: (context, authdata, _) {
              return InkWell(
                onTap: () {
                  authdata.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => SplashScreen()),
                      (route) => false);
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                      Text(
                        AppLocalization.of(context)
                            .getTranslatedValue("logout")
                            .toString(),
                        style: boldWhite,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
