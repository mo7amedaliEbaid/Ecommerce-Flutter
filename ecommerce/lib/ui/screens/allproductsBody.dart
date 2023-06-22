/*
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/productitem_widget.dart';

class AllProductsBody extends StatefulWidget {
  const AllProductsBody({Key? key}) : super(key: key);

  @override
  State<AllProductsBody> createState() => _AllProductsBodyState();
}

class _AllProductsBodyState extends State<AllProductsBody> {
  late Future<List<Product>> _listProducts;
  late ProductProvider productProvider;
  List<String> sortDropdown = [
    AppConstants.ALPHABET_LOW_TO_HIGH,
    AppConstants.ALPHABET_HIGHT_TO_LOW,
    AppConstants.PRICE_LOW_TO_HIGH,
    AppConstants.PRICE_HIGH_TO_LOW,
  ];

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _listProducts = productProvider.getallproducts();
  }

  @override
  Widget build(BuildContext context) {
    return
  }
}
*/
