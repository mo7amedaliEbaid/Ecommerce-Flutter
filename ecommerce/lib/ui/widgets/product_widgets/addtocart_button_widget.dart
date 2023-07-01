import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:myfirst_app/models/products_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import '../../../constants/global_constants.dart';
import '../../../constants/notifications.dart';
import '../../../services/localization.dart';
import '../../../providers/cart_provider.dart';

Widget buildAddToCartButton(BuildContext context, Product product,) {
  Future<void> _showNotification(String payload) async {
    const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails('your channel id', 'your channel name',
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'ticker');
    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        id++,
        'Alpha Store',
        'There are Some Changes have been made to your cart',
        notificationDetails,
        payload: payload);
  }
  Size size = MediaQuery.sizeOf(context);
  return Consumer<CartProvider>(builder: (context, data, _) {
    Product? selectedModel = data.cartlist.firstWhereOrNull(
        (Product selectedItem) => selectedItem.id == product.id);
    if (selectedModel == null) {
      return InkWell(
        onTap: () {
          data.addItemToCart(product);
          _showNotification("You have added ${product.title} to your cart");
        },
        child: Container(
          width: size.width * .3,
          height: size.height * .04,
          color: Colors.black,

          child: Center(
            child: AutoSizeText(
                AppLocalization.of(context)
                    .getTranslatedValue("buy")
                    .toString(),
              style: boldWhite.copyWith(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          data.removeSelectedItemFromCart(product.id!);
         _showNotification("You have Removed ${product.title} from your cart");
        },
        child: Container(
          width: size.width * .3,
          height: size.height * .04,
          color: Colors.grey.shade600,
          child: Center(
              child: AutoSizeText(
                AppLocalization.of(context)
                    .getTranslatedValue("remove")
                    .toString(),
            style: boldWhite.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          )),
        ),
      );
    }

  });

}
