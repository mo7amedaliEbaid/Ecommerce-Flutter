import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../models/products_model.dart';

class CartProvider extends ChangeNotifier {
  List<Product> cartlistProduct = [];
  GetStorage box = GetStorage();
  List<Product> cartlist = <Product>[];

  void addItemToCart(Product product) {
    product.quantity = 1;
    cartlist.add(product);
    List<Map<String, dynamic>> items_cart =
    cartlist.map((Product e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
    print("item Added Successfully");
    List<dynamic> value = GetStorage().read('items_cart');
print("$value vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv");
  }
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
  void updatingSession() {
    box.listenKey('items_cart', (updatedValue) {
      print(" $updatedValue");
      if (updatedValue is List) {
        cartlist.clear();
        cartlist.addAll(updatedValue.map((e) => Product.fromJson(e)).toList());
      }
    });
  }

  void decreaseQtyOfItemInCart(Product product) {
    if (product.quantity == 1) {
      cartlist.removeWhere((Product selectedItem) => selectedItem.id == product.id);
    } else {
      cartlist.removeWhere((Product selectedItem) => selectedItem.id == product.id);
      product.quantity--;
      cartlist.add(product);
    }
    List<Map<String, dynamic>> items_cart =
    cartlist.map((Product e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
  }

  void increaseQtyOfItemInCart(Product drink) {
    cartlist.removeWhere((Product selectedItem) => selectedItem.id == drink.id);
    drink.quantity++;
    cartlist.add(drink);

    List<Map<String, dynamic>> items_cart =
    cartlist.map((Product e) => e.toJson()).toList();
    box.write('items_cart', items_cart);
  }
  void removeSelectedItemFromCart(int id) {
    cartlist.removeWhere((Product selectedItem) => selectedItem.id == id);
    List<Map<String, dynamic>> items_cart =
    cartlist.map((Product e) => e.toJson()).toList();

    box.write('items_cart', items_cart);
  }

  void getUpdatedSessionCartData() {
    if (box.hasData('items_cart')) {
      List<dynamic> value = GetStorage().read('items_cart');
      if (value is List) {
        List<Product> getModelFromSession =
        value.map((e) => Product.fromJson(e)).toList();
        cartlist.clear();
        cartlist.addAll(getModelFromSession);
      }
    }
    updatingSession();
  }
  void transactionCompleted() {
    box.write("items_cart", []).then((value) {
     /* grandTotal.value = 0;
      cart.clear();
      Get.back();
      Get.snackbar("Message", "Transaction succeed ! ",
          colorText: Colors.white,
          backgroundColor: Color(0xff4D4D4D),
          snackPosition: SnackPosition.BOTTOM);
    });*/
  });}
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