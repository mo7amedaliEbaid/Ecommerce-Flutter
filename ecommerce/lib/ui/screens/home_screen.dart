import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/screens/productsByCategory.dart';
import 'package:provider/provider.dart';

import '../../constants/app_constants.dart';
import '../../localization/localization.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/myappbar_widget.dart';
import '../widgets/mypageview_widget.dart';
import '../widgets/featured_listview_widget.dart';
import 'categories_screen.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: MyAppBar(),
        body: _buildhomebody(context));
  }

  Widget _buildhomebody(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => CategoriesScreen()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("shop_by_category")
                        .toString(),
                    style: titleStyle),
                Icon(Icons.arrow_forward_ios)
              ],
            ),
          ),
        ),
        _buildcategories_listview(),
        MyPageView(),
        vertical_space,
        vertical_space,
        FeaturedListView(),
      ],
    );
  }

  Widget _buildcategories_listview() {
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
                  : _buildcategory_item(context, AppConstants.assets[index],
                      data.categories[index]);
            },
          ),
        );
      },
    );
  }

  Widget _buildcategory_item(
      BuildContext context, String imageasset, String categoryname) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductsbyCategory(
                  selectedCategory: categoryname,
                )));
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
        child: Column(
          children: [
            Container(
              width: 160,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage(imageasset), fit: BoxFit.fill)),
            ),
            vertical_space,
            Text(
              categoryname.toUpperCase(),
              style: titleStyle.copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
