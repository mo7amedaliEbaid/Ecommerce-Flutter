import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../models/products_model.dart';
import '../widgets/productitem_widget.dart';

class SearchedforScreen extends StatelessWidget {
  SearchedforScreen(
      {Key? key, required this.searchedlist, required this.searchedfor})
      : super(key: key);
  final List<Product> searchedlist;
  final String searchedfor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: AppBar(
          backgroundColor: scafoldBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Search Result",
            style: titleStyle,
          ),
          leading: Consumer<ProductProvider>(
            builder: (context, data, child) {
              return InkWell(
                onTap: () {
                  data.clearSearch();
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 25.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
              );
            },
          ),
          actions: [
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Icon(
                  Icons.shopping_bag,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        body: Consumer<ProductProvider>(builder: (context, data, child) {
          return ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Search Result”$searchedfor”',
                  style: titleStyle,
                ),
              ),
              data.searchedForproducts.length == 0
                  ? Column(
                      children: [
                        SizedBox(
                          height: 180,
                        ),
                        Icon(
                          Icons.search_off,
                          size: 50,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'No Results Found Yet!',
                          style: titleStyle,
                        ),
                      ],
                    )
                  : GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          childAspectRatio: 1.7 / 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                          crossAxisCount: 2),
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: data.searchedForproducts.length,
                      itemBuilder: (context, index) {
                        return ProductItem(
                            data.searchedForproducts[index],0
                        );
                      },
                    ),
            ],
          );
        }));
  }
}
