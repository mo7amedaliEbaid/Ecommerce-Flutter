import 'package:flutter/material.dart';

import '../models/products_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartlistProduct = [];

  void add(Product item, int quantity) {
    for (int i = 0; i < cartlistProduct.length; i++) {
      if (cartlistProduct[i].title == item.title) {
        cartlistProduct[i].quantity = cartlistProduct[i].quantity + quantity;
        notifyListeners();
        return;
      }
    }
    Product product = Product.fromItem(item, 1);
    cartlistProduct.add(product);
    notifyListeners();
  }

  void updateQuantity(Product product, int newQuantity) {
    for (int i = 0; i < cartlistProduct.length; i++) {
      if (cartlistProduct[i].title == product.title) {
        cartlistProduct[i].quantity = newQuantity;
        if (newQuantity == 0) remove(product);
        notifyListeners();
        return;
      }
    }
  }

  double totalPrice() {
    double total = 0;
    for (Product product in cartlistProduct) {
      total += (product.price! * product.quantity);
    }
    return total;
  }

  void remove(Product item) {
    cartlistProduct.remove(item);
    notifyListeners();
  }
}