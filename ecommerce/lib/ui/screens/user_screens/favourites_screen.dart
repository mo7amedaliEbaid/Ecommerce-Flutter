import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/products_model.dart';
import '../../../services/localization.dart';

class FavouritesScreen extends StatefulWidget {
  FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  late FavouritesProvider cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<FavouritesProvider>(context, listen: false);
    cartProvider.getUpdatedSessionfavData();
  }

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
                  vertical_space,
                  buildListProcductfav(context),
                  vertical_space,
                ]),
          ],
        ),
      ),
    );
  }

  buildTitlefavourite() {
    return Consumer<FavouritesProvider>(
      builder: (context, data, _) {
        return data.favouriteslist.isEmpty
            ? Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("fav")
                      .toString(),
                  style: titleStyle,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                        AppLocalization.of(context)
                            .getTranslatedValue("fav")
                            .toString(),
                        style: titleStyle),
                    SizedBox(
                      height: 5,
                    ),
                    AutoSizeText(
                      "${data.favouriteslist.length} Products",
                      style: mediumStyle,
                    ),
                  ],
                ),
              );
      },
    );
  }

  buildListProcductfav(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Consumer<FavouritesProvider>(
      builder: (context, data, _) {
        return data.favouriteslist.length == 0
            ? Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: size.height * .2,
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
                  ...data.favouriteslist
                      .map((e) => buildProductfav(context, e)),
                 vertical_space
                ],
              );
      },
    );
  }

  buildProductfav(BuildContext context, Product product) {
    Size size = MediaQuery.sizeOf(context);
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
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
                        image: NetworkImage(product.image!),
                        fit: BoxFit.contain)),
              ),
              horizontal_space,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin:EdgeInsets.symmetric(vertical: 15) ,
                    width:size.width*.42,
                    height: size.height*.05,
                    child: AutoSizeText(
                      product.title!,
                      maxLines: 3,
                      style: lightStyle,
                    ),
                  ),

                  Row(
                    children: [
                      Text(
                        "${product.price}  KWD",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: size.height*.05),
                        child: InkWell(
                          onTap: () {
                            Provider.of<FavouritesProvider>(context, listen: false)
                                .removeSelectedItemFromfavourites(product.id!);
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

            ],
          ),
        ],
      ),
    );
  }
}
