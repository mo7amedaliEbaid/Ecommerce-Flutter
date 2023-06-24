import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/products_model.dart';

class FavouritesProvider extends ChangeNotifier {
  GetStorage box = GetStorage();
  List<Product> favouriteslist = <Product>[];

  void addItemTofavourites(Product product) {
    // product.quantity = 1;
    favouriteslist.add(product);
    List<Map<String, dynamic>> items_fav =
        favouriteslist.map((Product e) => e.toJson()).toList();
    notifyListeners();

    box.write('items_fav', items_fav);
    print("item Added Successfully");
    List<dynamic> value = GetStorage().read('items_fav');
    notifyListeners();

    print(
        "$value vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
  }

  void updatingSession() {
    box.listenKey('items_fav', (updatedValue) {
      print(" $updatedValue");
      if (updatedValue is List) {
        favouriteslist.clear();
        favouriteslist
            .addAll(updatedValue.map((e) => Product.fromJson(e)).toList());
        notifyListeners();
      }
    });
  }

  void removeSelectedItemFromfavourites(int id) {
    favouriteslist.removeWhere((Product selectedItem) => selectedItem.id == id);
    List<Map<String, dynamic>> items_fav =
        favouriteslist.map((Product e) => e.toJson()).toList();

    box.write('items_fav', items_fav);
    notifyListeners();
  }

  void getUpdatedSessionfavData() {
    if (box.hasData('items_fav')) {
      List<dynamic> value = GetStorage().read('items_fav');
      if (value is List) {
        List<Product> getModelFromSession =
            value.map((e) => Product.fromJson(e)).toList();
        favouriteslist.clear();
        favouriteslist.addAll(getModelFromSession);
      }
    }
    updatingSession();
  }
}
