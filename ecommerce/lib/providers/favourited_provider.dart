import 'package:flutter/material.dart';

import '../models/products_model.dart';


class FavouritesProvider extends ChangeNotifier {
  List<Product> favouritelistProduct = [];

  void add({ required Product item}) {
    Product product = Product.fromItemfav(item, 1);
    favouritelistProduct.add(product);
    notifyListeners();
  }


  void remove(Product item) {
    favouritelistProduct.remove(item);
    notifyListeners();
  }
}