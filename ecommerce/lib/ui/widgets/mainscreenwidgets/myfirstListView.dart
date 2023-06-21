import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../providers/product_provider.dart';
import '../loading_shimmer.dart';
import '../mycategoryItem.dart';


class MyfirstListview extends StatefulWidget {
  MyfirstListview({Key? key}) : super(key: key);

  @override
  State<MyfirstListview> createState() => _MyfirstListviewState();
}

class _MyfirstListviewState extends State<MyfirstListview> {
  late Future<List> listcategories;
  late ProductProvider productProvider;
  CustomConstants constants = CustomConstants();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    listcategories = productProvider.getListCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, data, child) {
        return Container(
          height: 250,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: data.categories.length,
            itemBuilder: (context, index) {
              return data.categories.length == 0
                  ? loadingShimmer()
                  : CategoryItem(
                      imageasset: constants.assets[index],
                      categoryname: data.categories[index]);
            },
          ),
        );
      },
    );
  }
}
