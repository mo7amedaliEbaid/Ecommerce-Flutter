import 'package:flutter/material.dart';
import 'package:myfirst_app/ui/screens/products_screens/productsbyCategory_body.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/cartbadge_widget.dart';

class ProductsbyCategory extends StatelessWidget {
  ProductsbyCategory({Key? key, required this.selectedCategory})
      : super(key: key);
  String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        centerTitle: true,
        title: Text(
          selectedCategory.toUpperCase(),
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
        actions: [
         Padding(
           padding:  EdgeInsets.fromLTRB( 10.0,10,15,10),
           child: buildcart_badge(),
         )
        ],
      ),
      body: ProductsbyCategoryBody(
        selectedCategory: selectedCategory,
      ),
    );
  }
}
