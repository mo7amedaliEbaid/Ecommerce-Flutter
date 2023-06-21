import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/favourited_provider.dart';
import 'package:provider/provider.dart';

import '../../models/products_model.dart';

class FavouritePge extends StatelessWidget {
  FavouritePge({super.key, required this.favouritelistProduct});

  final List<Product> favouritelistProduct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scafoldBackground,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: scafoldBackground,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        title: Text(
          'Favourites',
          style: mediumStyle,
        ),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTitlefavourite(),
                  const SizedBox(
                    height: 10,
                  ),
                  buildListProcductfav(context),
                  const SizedBox(
                    height: 10,
                  ),
                ]),
          ],
        ),
      ),
    );
  }

  buildTitlefavourite() {
    return Consumer<FavouritesProvider>(
      builder: (context, data, _) {
        return data.favouritelistProduct.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: const Text(
                  "Favourites",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Favourites",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              );
      },
    );
  }

  buildListProcductfav(BuildContext context) {
    return Consumer<FavouritesProvider>(
      builder: (context, data, _) {
        return data.favouritelistProduct.length == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 120,
                    ),
                    Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Your Favorites is Empty",
                      style: titleStyle,
                    ),
                  ],
                ),
              )
            : Column(
            children: [
              ...data.favouritelistProduct
                  .map((e) => buildProductfav(context, e)),
              SizedBox(height: 15,)
            ],
              );
      },
    );
  }

  buildProductfav(BuildContext context, Product product) {
    return Container(
      margin: EdgeInsets.all(15),
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
                    width: 80,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(product.image!), fit: BoxFit.contain)),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 150,
                        child: Text(
                          product.title!,
                          maxLines: 2,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "${product.price }  KWD",
                            // "test",
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 65, 0, 0),

                    child: InkWell(
                      onTap: () {
                        Provider.of<FavouritesProvider>(context, listen: false)
                            .remove(product);
                      },
                      child: const Icon(
                        Icons.favorite,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),

    );
  }
}
