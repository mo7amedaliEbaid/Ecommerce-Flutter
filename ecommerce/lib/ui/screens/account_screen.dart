import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:myfirst_app/ui/screens/orders_screen.dart';
import 'package:provider/provider.dart';
import '../../constants/global_constants.dart';
import '../../services/localization.dart';
import 'favourites_screen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

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
          "Account",
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
        width: size.width * 0.92,
        height: size.height * .95,
        margin: EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: Container(
                            margin: EdgeInsets.only(left: size.width * 0.4),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: size.height * 0.09,
                                ),
                                Text(
                                  'Mohamed Ali',
                                  style: titleStyle,
                                ),
                                SizedBox(
                                  height: size.height * 0.01,
                                ),
                                Text(
                                  'username@gmail.com',
                                  style: hintStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.09,
                        ),
                      ],
                    ),
                    Positioned(
                      top: size.height * .13,
                      left: size.width * 0.05,
                      child: Container(
                        width: size.width * 0.3,
                        height: size.height * .18,
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
                Consumer<FavouritesProvider>(
                  builder: (context, data, _) => InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => FavouritePge()));
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
                            "My Favourites",
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
                ),
                SizedBox(height: size.height * 0.03),
                InkWell(
                  onTap: () {
                    /*Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => OrdersScreen()));*/
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
                              .getTranslatedValue("orders")
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
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReturnScreen()));
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
                          "Address Book",
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
                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ReturnScreen()));
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
                          Icons.lock,
                          color: Colors.white,
                        ),
                        Text(
                          "Change Password",
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
