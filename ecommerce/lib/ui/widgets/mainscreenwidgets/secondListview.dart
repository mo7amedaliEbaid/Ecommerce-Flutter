import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../providers/product_provider.dart';
import '../loading_shimmer.dart';
import '../productitem_widget.dart';


class SecondListview extends StatefulWidget {
  SecondListview({Key? key}) : super(key: key);

  @override
  State<SecondListview> createState() => _SecondListviewState();
}

class _SecondListviewState extends State<SecondListview> {
  late Future<List<Product>> listProducts;
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    listProducts = productProvider.getallproducts();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, data, child) {
        return Container(
          height: 380,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return data.allproducts.length == 0
                  ? loadingShimmer()
                  : ProductItem(
                  data.allproducts[index],150
                    );
            },
          ),
        );
      },
    );
  }
}
