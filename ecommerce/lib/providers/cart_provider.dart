import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/products_model.dart';

class CartProvider extends ChangeNotifier {
  GetStorage box = GetStorage();
  List<Product> cartlist = <Product>[];

  void addItemToCart(Product product) {
    // product.quantity = 1;
    cartlist.add(product);
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Product e) => e.toJson()).toList();
    notifyListeners();

    box.write('items_cart', items_cart);
    print("item Added Successfully");
    List<dynamic> value = GetStorage().read('items_cart');
    notifyListeners();

    //print(
    //   "$value vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
  }

  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      print(" $updatedValue");
      if (updatedValue is List) {
        cartlist.clear();
        cartlist.addAll(updatedValue.map((e) => Product.fromJson(e)).toList());
        notifyListeners();
      }
    });
  }

  double grandTotal = 0;

  void calculateGrandTotal() {
    grandTotal = 0;
    for (int i = 0; i < cartlist.length; i++) {
      grandTotal = grandTotal +
          (cartlist[i].quantity * cartlist[i].price!.round()).round();
    }
  }

  void decreaseQtyOfItemInCart(Product product) {
    if (product.quantity == 1) {
      cartlist
          .removeWhere((Product selectedItem) => selectedItem.id == product.id);
      notifyListeners();
    } else {
      cartlist
          .removeWhere((Product selectedItem) => selectedItem.id == product.id);
      product.quantity--;
      cartlist.add(product);
      notifyListeners();
    }
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Product e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
    notifyListeners();
  }

  void increaseQtyOfItemInCart(Product product) {
    cartlist
        .removeWhere((Product selectedItem) => selectedItem.id == product.id);
    product.quantity++;
    cartlist.add(product);
    notifyListeners();

    List<Map<String, dynamic>> items_cart =
        cartlist.map((Product e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
    notifyListeners();
  }

  void removeSelectedItemFromCart(int id) {
    cartlist.removeWhere((Product selectedItem) => selectedItem.id == id);
    List<Map<String, dynamic>> items_cart =
        cartlist.map((Product e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
    notifyListeners();
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      List<Product> getModelFromSession =
          value.map((e) => Product.fromJson(e)).toList();
      cartlist.clear();
      cartlist.addAll(getModelFromSession);
    }
    updatingSession();
    notifyListeners();
  }

  void transactionCompleted(BuildContext context) {
    box.write("items_cart", []).then((value) {
      grandTotal = 0;
      cartlist.clear();
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Message, Transaction succeed ! ")));
    });
  }
}
