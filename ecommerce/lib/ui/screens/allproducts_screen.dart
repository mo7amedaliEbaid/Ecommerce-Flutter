import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:provider/provider.dart';
import '../../constants/global_constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/productitem_widget.dart';
import 'allproductsBody.dart';

class AllProductsScreen extends StatelessWidget {
   AllProductsScreen({Key? key, required this.allproductslist}) : super(key: key);
final List<Product> allproductslist;
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
          'All Products',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Icon(Icons.shopping_bag),
          ),
        ],
      ),
      body: _buildproducts_body(),
    );
  }

  _buildproducts_body() {
    return Consumer<ProductProvider>(builder: (context, data, child) {
      //data.getallproducts();
       return Column(
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(14.0, 5, 1, 20),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 //Text('Sort Products'),
                 DropdownButton<String>(
                   underline: Container(),
                   hint: Text(
                     'Sort Products',
                     style: hintStyle,
                   ),
                   // dropdownColor: Colors.blue,
                   icon: Icon(
                     Icons.sort,
                     color: Colors.black,
                     size: 40,
                   ),
                   items: AppConstants.sortDropdown
                       .map<DropdownMenuItem<String>>((String value) {
                     return DropdownMenuItem<String>(
                       value: value,
                       child: Text(value),
                     );
                   }).toList(),
                   onChanged: (value) {
                     data.sortListProduct(value);
                   },
                 ),
               ],
             ),
           ),
           Flexible(
             child: GridView.builder(
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 childAspectRatio: 1.7 / 3,
                 crossAxisSpacing: 0,
                 mainAxisSpacing: 0,
               ),
               shrinkWrap: true,
               physics: const ClampingScrollPhysics(),
               padding: EdgeInsets.zero,
               itemCount: data.allproducts.length,
               itemBuilder: (context, index) {
                 return data.allproducts.length == 0
                     ? loadingShimmer()
                     : ProductItem(data.allproducts[index], 0);
               },
             ),
           ),
         ],
       );
    });
  }
}
