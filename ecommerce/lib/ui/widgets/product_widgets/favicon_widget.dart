import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/models/products_model.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';

Widget buildFavicon(BuildContext context,Product product,bool istransparent){
  Size size = MediaQuery.sizeOf(context);
  return Consumer<FavouritesProvider>(builder: (context, data, _) {
    Product? selectedModel = data.favouriteslist.firstWhereOrNull(
            (Product selectedItem) => selectedItem.id == product.id);
    if (selectedModel == null) {
      return InkWell(
        onTap: () {
          data.addItemTofavourites(product);
        },
        child: Container(
          width: size.width * .07,
          height: size.height * .04,
          color:istransparent? Colors.transparent:Colors.white,

          child: Center(
            child:Icon(Icons.favorite_border_outlined)
          ),
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          data.removeSelectedItemFromfavourites(product.id!);
        },
        child: Container(
          width: size.width * .07,
          height: size.height * .04,
          color: istransparent? Colors.transparent:Colors.white,
          child: Center(
              child: Icon(Icons.favorite)),
        ),
      );
    }
  });
}