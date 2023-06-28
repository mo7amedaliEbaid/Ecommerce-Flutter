import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_constants.dart';
import '../../../providers/product_provider.dart';
import '../../widgets/app_widgets/loading_shimmer.dart';
import '../products_screens/productsByCategory.dart';

class CategoriesScreen extends StatelessWidget {
  CategoriesScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Icon(Icons.add_alert_sharp),
          ),
          centerTitle: true,
          title: Text(
            'All Categories',
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
        backgroundColor: Colors.grey.shade300,
        body: Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: ListView.builder(
            itemCount: data.categories.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return data.categories.length == 0
                  ? loadingShimmer()
                  : _buildcategory_row(context,
                  AppConstants.assets[index],
                  data.categories[index]);
            },
          ),
        ),
      );
    });
  }

  _buildcategory_row(BuildContext context, String img, String catname) {
    Size size=MediaQuery.sizeOf(context);
   return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                ProductsbyCategory(
                  selectedCategory: catname,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              width: size.width*.3,
              height: size.height*.16,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54,width: 1),
                  image: DecorationImage(
                      image: AssetImage(img), fit: BoxFit.fill)),
            ),
            horizontal_space,
            horizontal_space,
            AutoSizeText(
              catname.toUpperCase(),
              style:titleStyle,
            ),

          ],
        ),
      ),
    );
  }
}

