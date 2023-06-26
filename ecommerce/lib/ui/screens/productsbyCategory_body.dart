import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../constants/global_constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/productitem_widget.dart';

class ProductsbyCategoryBody extends StatefulWidget {
  ProductsbyCategoryBody({Key? key, required this.selectedCategory})
      : super(key: key);
  String selectedCategory;

  @override
  State<ProductsbyCategoryBody> createState() => _ProductsbyCategoryBodyState();
}

class _ProductsbyCategoryBodyState extends State<ProductsbyCategoryBody> {
  late Future<List<Product>> _listProductsbycategory;
  late ProductProvider productProvider;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _listProductsbycategory = productProvider.getproductsbycategoryelec(
        selectedCategory: widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, child) {
      return data.categories.length == 0
          ? loadingShimmer()
          : Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 12.0, vertical: 5),
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
                        data.sortListProductcat(value);
                      },
                    ),
                  ],
                ),
              ),
              Flexible(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.5 / 3,
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                  ),
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: data.productsbyCat.length,
                  itemBuilder: (context, index) {
                    return ProductItem(
                        data.productsbyCat[index],0
                    );
                  },
                ),
              ),
            ],
          );
    });
  }
}
