import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/providers/favourited_provider.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import 'details_screen.dart';

class DetailsBody extends StatefulWidget {
  DetailsBody({required this.selectedproductid});

  int selectedproductid;

  @override
  State<DetailsBody> createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  late Product chosenproduct;
  late Future<List<Product>> _listProducts;
  late ProductProvider productProvider;
  PageController _topPageController = PageController();
  PageController _mainPageController = PageController();
  PageController _secondPageController = PageController();
  late CartProvider cartProvider;
  late FavouritesProvider favouritesProvider;

  @override
  void initState() {
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    favouritesProvider =
        Provider.of<FavouritesProvider>(context, listen: false);
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    _listProducts = productProvider.getallproducts();
    _topPageController = PageController(
        initialPage: widget.selectedproductid - 1, viewportFraction: 1);
    _mainPageController = PageController(
      initialPage: widget.selectedproductid - 1,
    )..addListener(_onMainScroll);

    _secondPageController =
        PageController(initialPage: widget.selectedproductid - 1)
          ..addListener(_onMainScroll);

    super.initState();
  }

  _onMainScroll() {
    _topPageController.animateTo(_secondPageController.offset,
        duration: Duration(milliseconds: 150), curve: Curves.decelerate);
  }

  _goToPage(int page) {
    _topPageController.animateToPage(page,
        duration: Duration(milliseconds: 150), curve: Curves.decelerate);
    _mainPageController.animateToPage((page / 7).round(),
        duration: Duration(milliseconds: 40), curve: Curves.decelerate);
    _secondPageController.animateToPage(page,
        duration: Duration(milliseconds: 40), curve: Curves.decelerate);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListView(
        children: [
          Consumer<ProductProvider>(builder: (context, data, child) {
            return Container(
              width: 400,
              height: 300,
              color: Colors.white,
              child: PageView.builder(
                  controller: _topPageController,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: productProvider.allproducts.length,
                  itemBuilder: (context, index) {
                    return Stack(children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    NetworkImage(data.allproducts[index].image!),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                      if (index != 0)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: scafoldBackground,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () {
                                _goToPage(index - 1);
                              },
                            ),
                          ),
                        ),
                      if (index != data.allproducts.length - 1)
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: scafoldBackground,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                _goToPage(index + 1);
                              },
                            ),
                          ),
                        ),
                    ]);
                  }),
            );
          }),
          Container(
            color: Colors.white,
            height: size.height * .005,
          ),
          Consumer<ProductProvider>(builder: (context, data, child) {
            return data.allproducts.length == 0
                ? loadingShimmer()
                : Container(
                    height: 110,
                    child: ListView.builder(
                        controller: _mainPageController,
                        itemCount: data.allproducts.length,
                        scrollDirection: Axis.horizontal,
                        //shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                            detailsproductid:
                                                data.allproducts[index].id!,
                                          )));
                            },
                            child: Container(
                              height: 100,
                              width: 80,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          data.allproducts[index].image!),
                                      fit: BoxFit.fill)),
                            ),
                          );
                        }),
                  );
          }),
          SizedBox(
            height: size.height * .02,
          ),
          Consumer<ProductProvider>(builder: (context, data, index) {
            return data.allproducts.length == 0
                ? loadingShimmer()
                : Container(
                    width: 400,
                    height: 580,
                    child: PageView.builder(
                        controller: _secondPageController,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: data.allproducts.length,
                        itemBuilder: (context, index) {
                          return Container(
                            // height: 490,
                            width: 400,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      10.0, 10, 12, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        height: size.height * .1,
                                        width: size.width * .7,
                                        child: Text(
                                          data.allproducts[index].title!,
                                          maxLines: 2,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            favouritesProvider.add(
                                                item: data.allproducts[index]);
                                            /*setState(() {
                        _favourites = favouritesProvider.favouritelistProduct;
                      });*/
                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                          )),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(18.0,0,18,20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconTheme(
                                        data: IconThemeData(
                                          color: Colors.grey,
                                          size: 30,
                                        ),
                                        child: StarDisplay(value: data.allproducts[index].rating?["rate"].round()),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "Votes",
                                            style: hintStyle,
                                          ),
                                          Text(
                                            data.allproducts[index].rating!["count"].toString(),
                                            style: hintStyle,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 22.0),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        data.allproducts[index].category!.toUpperCase(),
                                        style: hintStyle,
                                      )),
                                ),
                                SizedBox(
                                  height: size.height * .01,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    //SizedBox(width: size.width*.05,),
                                    Column(
                                      children: [
                                        Text('price', style: hintStyle),
                                        SizedBox(
                                          height: size.height * .008,
                                        ),
                                        Text(
                                          '${data.allproducts[index].price}',
                                          style: lightStyle,
                                        ),
                                      ],
                                    ),
                                    // SizedBox(width: size.width*.05,),
                                    Align(
                                      alignment: Alignment.bottomRight,
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.share,
                                            size: 20,
                                          ),
                                          SizedBox(
                                            width: size.width * .03,
                                          ),
                                          Text(
                                            'Share'.toUpperCase(),
                                            style: meduimStyle,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.all(10),
                                  color: Colors.black,
                                  height: 2,
                                  width: double.infinity,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      21.0, 10, 0, 10),
                                  child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'About the product',
                                        style: lightStyle,
                                      )),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(22, 0, 22, 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      data.allproducts[index].description!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black,
                                        decoration: TextDecoration.none,
                                        fontSize: 15,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: size.width * 0.4,
                                      height: size.height * 0.09,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5),
                                          topLeft: Radius.circular(5),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          if (index != 0)
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: scafoldBackground,
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons.minimize),
                                                onPressed: () {
                                                  _goToPage(index - 1);
                                                },
                                              ),
                                            ),
                                          Text(
                                            '${data.allproducts[index].id}',
                                            style: titleStyle,
                                          ),
                                          if (index !=
                                              data.allproducts.length - 1)
                                            Container(
                                              width: 40,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: scafoldBackground,
                                              ),
                                              child: IconButton(
                                                icon: Icon(Icons.add),
                                                onPressed: () {
                                                  _goToPage(index + 1);
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        cartProvider.add(
                                            data.allproducts[index], 1);
                                      },
                                      child: Container(
                                        width: size.width * 0.4,
                                        height: size.height * 0.09,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(5),
                                            topRight: Radius.circular(5),
                                          ),
                                        ),
                                        child: Align(
                                            alignment: Alignment.center,
                                            child: Text(
                                              'Add to cart'.toUpperCase(),
                                              style: boldWhite,
                                            )),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }),
                  );
          }),
          /*SizedBox(
            height: size.height * .01,
          ),*/
        ],
      ),
    );
  }
}
