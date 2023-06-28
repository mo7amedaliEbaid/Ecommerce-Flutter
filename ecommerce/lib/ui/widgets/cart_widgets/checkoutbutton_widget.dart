import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_constants.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/notifications_provider.dart';


Widget CheckoutWidget(BuildContext context) {
  Size size = MediaQuery.sizeOf(context);
  return Consumer2<CartProvider, Notificationsprovider>(
      builder: (context, cartdata, notidata, _) {
        return TextButton(
          onPressed: () async {
            SharedPreferences preferences = await SharedPreferences
                .getInstance();
            showDialog<String>(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  //  height: 500,
                  margin: EdgeInsets.symmetric(vertical: size.height * .15),
                  child: AlertDialog(
                    title: Text("Really want to proceed ?"),
                    content: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: size.width * .7,
                          height: size.height * .3,
                          child: ListView.separated(
                            separatorBuilder: (_, i) => Divider(),
                            itemCount: cartdata.cartlist.length,
                            itemBuilder: (_, index) {
                              return ListTile(
                                leading: Container(
                                  width: size.width * .15,
                                  height: size.height * .1,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              cartdata.cartlist[index]
                                                  .image!))),
                                ),
                                title: AutoSizeText(
                                  cartdata.cartlist[index].title!,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                ),
                                subtitle: Text(
                                  "\$. " +
                                      NumberFormat.currency(
                                          decimalDigits: 0, symbol: '')
                                          .format(
                                          cartdata.cartlist[index].price) +
                                      " x " +
                                      cartdata.cartlist[index].quantity
                                          .toString(),
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 11),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          preferences.getString("username")!,
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            preferences.getString("email")!,
                            style: smallStyle
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                            "Total \$. " +
                                NumberFormat.currency(
                                    decimalDigits: 0, symbol: '')
                                    .format(cartdata.calculateGrandTotal()),
                            style: smallStyle)
                      ],
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () {
                          cartdata.transactionCompleted(context);
                          notidata.showNotificationWithAudioAttributeAlarm();
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: Text(
                  'Proceed to checkout'.toUpperCase(),
                  style: boldWhite
              ),
            ),
          ),
        );
      });
}
