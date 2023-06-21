import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/constants.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import 'productsByCategory.dart';

class CategoryScr extends StatefulWidget {
  CategoryScr({Key? key}) : super(key: key);

  @override
  State<CategoryScr> createState() => _CategoryScrState();
}

class _CategoryScrState extends State<CategoryScr> {
  late Future<List> _listcategories;
  late ProductProvider productProvider;
  CustomConstants constants = CustomConstants();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _listcategories = productProvider.getListCategory();
  }

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
            itemBuilder: (context, index) {
              return data.categories.length == 0
                  ? loadingShimmer()
                  : AnotherCategoryItem(
                      imageasset: constants.assets[index],
                      categoryname: data.categories[index]);
            },
          ),
        ),
      );
    });
  }
}

class AnotherCategoryItem extends StatelessWidget {
  AnotherCategoryItem({required this.imageasset, required this.categoryname});

  final String imageasset;
  final String categoryname;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => ProductsbyCategory(
                  selectedCategory: categoryname,
                )));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        width: 400,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  width: 140,
                  height: 120,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imageasset), fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      width: 200,
                      child: Text(
                        categoryname.toUpperCase(),
                        style: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
