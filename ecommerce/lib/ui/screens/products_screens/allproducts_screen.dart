import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:provider/provider.dart';
import '../../../constants/global_constants.dart';
import '../../../models/products_model.dart';
import '../../../providers/product_provider.dart';
import '../../widgets/app_widgets/loading_shimmer.dart';
import '../../widgets/product_widgets/productitem_widget.dart';

class AllProductsScreen extends StatelessWidget {
   AllProductsScreen({Key? key, required this.allproductslist}) : super(key: key);
final List<Product> allproductslist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
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
       return Column(
         children: [
           Padding(
             padding: const EdgeInsets.fromLTRB(14.0, 5, 1, 0),
             child: Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 DropdownButton<String>(
                   underline: Container(),
                   hint: Text(
                     'Sort Products',
                     style: hintStyle,
                   ),
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
                 childAspectRatio: 1.6 / 3,
                 crossAxisSpacing: 0,
                 mainAxisSpacing: 0,
               ),
               shrinkWrap: true,
               physics: const BouncingScrollPhysics(),
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
