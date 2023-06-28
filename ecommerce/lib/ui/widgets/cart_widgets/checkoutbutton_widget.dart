import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants/global_constants.dart';
import '../../../providers/cart_provider.dart';
import '../../../providers/notifications_provider.dart';

class CheckoutWidget extends StatefulWidget {
  const CheckoutWidget({Key? key}) : super(key: key);

  @override
  State<CheckoutWidget> createState() => _CheckoutWidgetState();
}

class _CheckoutWidgetState extends State<CheckoutWidget> {
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
    return Consumer2<CartProvider, Notificationsprovider>(
        builder: (context, cartdata, notidata, _) {
      return TextButton(
        onPressed: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Really want to proceed ?"),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: ListView.separated(
                        separatorBuilder: (_, i) => Divider(),
                        itemCount: cartdata.cartlist.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          cartdata.cartlist[index].image!))),
                            ),
                            title: Text(
                              cartdata.cartlist[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            subtitle: Text(
                              "\$. " +
                                  NumberFormat.currency(
                                          decimalDigits: 0, symbol: '')
                                      .format(cartdata.cartlist[index].price) +
                                  " x " +
                                  cartdata.cartlist[index].quantity.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
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
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Total \$. " +
                          NumberFormat.currency(decimalDigits: 0, symbol: '')
                              .format(cartdata.calculateGrandTotal()),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
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
                      notidata.showNotification();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 60,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(5)),
          child: Center(
            child: Text(
              'Proceed to checkout'.toUpperCase(),
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
        ),
      );
    });
  }
}
