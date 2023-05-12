import 'package:flutter/material.dart';
import 'allproductsBody.dart';
class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
         appBar: AppBar(
           iconTheme: IconThemeData(
             color: Colors.black, //change your color here
           ),
           centerTitle: true,
           title: Text('All Products',style: TextStyle(color: Colors.black),),
           backgroundColor: Colors.grey.shade300,
           elevation: 0,
           actions: [
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 18.0),
               child: Icon(Icons.shopping_bag),
             ),
           ],
         ),
      body: AllProductsBody(),
    );
  }
}
