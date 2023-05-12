import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../../widgets/loading_shimmer.dart';
import '../../widgets/productitem.dart';

class AllProductsBody extends StatefulWidget {
  const AllProductsBody({Key? key}) : super(key: key);

  @override
  State<AllProductsBody> createState() => _AllProductsBodyState();
}

class _AllProductsBodyState extends State<AllProductsBody> {
  late Future<List<Product>> _listProducts;
  late ProductProvider productProvider;
  List<String> sortDropdown = [
    CustomConstants.ALPHABET_LOW_TO_HIGH,
    CustomConstants.ALPHABET_HIGHT_TO_LOW,
    CustomConstants.PRICE_LOW_TO_HIGH,
    CustomConstants.PRICE_HIGH_TO_LOW,
  ];

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _listProducts = productProvider.getallproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, child) {
      return SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(14.0, 5, 14, 20),
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
                    items: sortDropdown
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      Provider.of<ProductProvider>(context, listen: false)
                          .sortListProduct(value);
                    },
                  ),
                ],
              ),
            ),
            GridView.builder(
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
                    : ProductItem(
                        productImage: data.allproducts[index].image,
                        productId: data.allproducts[index].id,
                        productPrice: data.allproducts[index].price,
                        previousPrice: 0,
                        productTitle: data.allproducts[index].title,
                        productcategory: data.allproducts[index].category,
                        productrating: data.allproducts[index].rating,
                        productdescription: data.allproducts[index].description,
                      );
              },
            ),
          ],
        ),
      );
    });
  }
}
