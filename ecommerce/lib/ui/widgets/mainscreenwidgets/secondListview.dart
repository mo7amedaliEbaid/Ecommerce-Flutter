import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_constants.dart';
import '../../../localization/localization.dart';
import '../../../models/products_model.dart';
import '../../../providers/product_provider.dart';
import '../../screens/allproducts_screen.dart';
import '../loading_shimmer.dart';
import '../productitem_widget.dart';


class SecondListview extends StatefulWidget {
  SecondListview({Key? key}) : super(key: key);

  @override
  State<SecondListview> createState() => _SecondListviewState();
}

class _SecondListviewState extends State<SecondListview> {
 /* late Future<List<Product>> listProducts;
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
 //   listProducts = productProvider.getallproducts();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (context, data, child) {
        data.getallproducts();
        return Column(
          children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(AppLocalization.of(context)
                  .getTranslatedValue("featured_products")
                  .toString(),
                  style: titleStyle
              ),
            ),
            //SizedBox(width: 90,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: ElevatedButton(
                autofocus: false,
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(scafoldBackground)
                ),
                onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllProductsScreen(allproductslist: data.allproducts,)));
                },
                child: Text(AppLocalization.of(context)
                    .getTranslatedValue("view_all")
                    .toString(),
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w600
                  ),),
              ),
            ),
          ],
        ),

        SizedBox(height: 20,),
            Container(
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
            ),
          ],
        );
      },
    );
  }
}
