import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:myfirst_app/constants/api_constansts.dart';
import '../constants/app_constants.dart';
import '../models/products_model.dart';


class ProductProvider extends ChangeNotifier {
 List<Product> allproducts =[];
 List<Product> products =[];
 List<Product> cartList =[];
 List<Product> searchedForproducts=[];
 List<Product> favouriteProducts=[];
 List<Product> productsbyCat =[];
  List categories = [];
   late Product oneproductbyId;
  List<String> listTitle = [];
 void sortListProduct(condition) {
   switch (condition) {
     case AppConstants.PRICE_LOW_TO_HIGH:
       allproducts.sort((a, b) {
         return a.price!.compareTo(b.price!);
       });
       break;
     case AppConstants.PRICE_HIGH_TO_LOW:
       allproducts.sort((a, b) {
         return b.price!.compareTo(a.price!);
       });
       break;
     case AppConstants.ALPHABET_LOW_TO_HIGH:
       allproducts.sort((a, b) {
         return a.title!.compareTo(b.title!);
       });
       break;
     case AppConstants.ALPHABET_HIGHT_TO_LOW:
       allproducts.sort((a, b) {
         return b.title!.compareTo(a.title!);
       });
       break;
     default:
   }
   notifyListeners();
 }
 void sortListProductcat(condition) {
   switch (condition) {
     case AppConstants.PRICE_LOW_TO_HIGH:
       productsbyCat.sort((a, b) {
         return a.price!.compareTo(b.price!);
       });
       break;
     case AppConstants.PRICE_HIGH_TO_LOW:
       productsbyCat.sort((a, b) {
         return b.price!.compareTo(a.price!);
       });
       break;
     case AppConstants.ALPHABET_LOW_TO_HIGH:
       productsbyCat.sort((a, b) {
         return a.title!.compareTo(b.title!);
       });
       break;
     case AppConstants.ALPHABET_HIGHT_TO_LOW:
       productsbyCat.sort((a, b) {
         return b.title!.compareTo(a.title!);
       });
       break;
     default:
   }
   notifyListeners();
 }
 List<String> getListTilte() {
   return listTitle;
 }
  Future<List<Product>> getproductsbycategoryelec(
      {required String selectedCategory}) async {
    var response = await http.get(Uri.parse(
        "${Apiconstants.BASE_URL}${Apiconstants.PRODUCTS}/${Apiconstants.BY_CATEGORY}/$selectedCategory"));
    print('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    List productsTempList = [];
    for (var v in data) {
      productsTempList.add(v);
      log(v.toString());
      print(data.length.toString());
    }
    if (response.statusCode == 200) {
      productsbyCat=Product.productsFromSnapshot(productsTempList);
      notifyListeners();
      return productsbyCat;
      //return Product.productsFromSnapshot(newsTempList);
    } else {
      throw Exception('Failed to load album');
    }
  }
   Future<Product> getProductById({required int id}) async {
    try {
      var response = await http.get(Uri.parse('${Apiconstants.BASE_URL}${Apiconstants.PRODUCTS}/$id'));
      print("response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      oneproductbyId=Product.fromJson(data);
      notifyListeners();
      return oneproductbyId;
    } catch (error) {
      log("an error occured while getting product info $error");
      throw error.toString();
    }
  }

  Future<List<Product>> getallproducts() async {
    var response = await http.get(Uri.parse(
        '${Apiconstants.BASE_URL}${Apiconstants.PRODUCTS}'));
    print('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    List newsTempList = [];
    for (var v in data) {
      newsTempList.add(v);
      log(v.toString());
      print(data.length.toString());
    }
    if (response.statusCode == 200) {
     allproducts=Product.productsFromSnapshot(newsTempList);

     //notifyListeners();
     //log(allproducts.toString());
      return allproducts;
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List> getListCategory() async {
    var client = http.Client();
    var jsonString = await client.get(Uri.parse('${Apiconstants.BASE_URL}${Apiconstants.PRODUCTS}/${Apiconstants.ALL_CATEGORIES}'));
    var jsonObject = jsonDecode(jsonString.body);
    print(jsonString.toString());
    if(jsonString.statusCode==200){
      categories = jsonObject;
      notifyListeners();

      return categories;
    }else{
      throw Exception("Failed to load categories list");
    }

  }
 Future<List<Product>> getListSearch(String searchValue) async {
   var response = await http.get(Uri.parse(
       '${Apiconstants.BASE_URL}${Apiconstants.PRODUCTS}'));
   print('Response status: ${response.statusCode}');
   log('Response body: ${response.body}');
   var data = jsonDecode(response.body);
   List newsTempList = [];
   for (var v in data) {
     newsTempList.add(v);
   /*  log(v.toString());
     print(data.length.toString());*/
   }
     products=Product.productsFromSnapshot(newsTempList);
   searchedForproducts = products
       .where((e) => e.title!.toLowerCase().contains(searchValue.toLowerCase()))
       .toList();
   log(searchedForproducts.last.title!);
   notifyListeners();
   return searchedForproducts;

 }


 void clearSearch(){
    searchedForproducts.clear();
 }

}





















