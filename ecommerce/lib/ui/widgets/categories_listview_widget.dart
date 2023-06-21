import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../providers/product_provider.dart';
import 'loading_shimmer.dart';
import 'categoryItem_widget.dart';

Widget categories_listview(BuildContext context) {
  return Consumer<ProductProvider>(
    builder: (context, data, child) {
      data.getListCategory();
      return Container(
        height: 250,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: data.categories.length,
          itemBuilder: (context, index) {
            return data.categories.length == 0
                ? loadingShimmer()
                : CategoryItem(context, AppConstants.assets[index],
                    data.categories[index]);
          },
        ),
      );
    },
  );
}
