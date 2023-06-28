import 'package:myfirst_app/models/products_model.dart';

class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    required this.body,
    required this.payload,
    this.product,
  });
  Product? product;
  final int id;
  final String? title;
  final String? body;
  final String? payload;
}
