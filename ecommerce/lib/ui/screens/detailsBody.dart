import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/providers/favourites_provider.dart';
import 'package:myfirst_app/ui/widgets/addtocart_button_widget.dart';
import 'package:myfirst_app/ui/widgets/changequantity_widget.dart';
import 'package:myfirst_app/ui/widgets/favicon_widget.dart';
import 'package:provider/provider.dart';

import '../../constants/global_constants.dart';
import '../../models/products_model.dart';
import '../../providers/product_provider.dart';
import '../widgets/loading_shimmer.dart';
import '../widgets/stardisplay_widget.dart';
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

  @override
  void initState() {
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
    Size size = MediaQuery.sizeOf(context);
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
      child: ListView(
        children: [
          Consumer<ProductProvider>(builder: (context, data, child) {
            return Container(
              height: size.height * .3,
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
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    data.allproducts[index].image!),
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
                    height: size.height * .14,
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
                              width: size.width * .24,
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                              ),
                              child: data.allproducts[index].image != null
                                  ? Image.network(
                                      data.allproducts[index].image!,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(AppConstants.appbar_image),
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
                              //height: 490,
                              // width: 400,
                              child: Column(children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 30, 0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                      height: size.height * .07,
                                      width: size.width * .7,
                                      child: AutoSizeText(
                                          textAlign: TextAlign.center,
                                          data.allproducts[index].title!,
                                          maxLines: 2,
                                          style: mediumStyle)),
                                  buildFavicon(
                                      context, data.allproducts[index], true),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(18.0, 0, 18, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconTheme(
                                    data: IconThemeData(
                                      color: Colors.grey,
                                      size: 30,
                                    ),
                                    child: StarDisplay(data
                                        .allproducts[index].rating?["rate"]
                                        .round()),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Votes",
                                        style: hintStyle,
                                      ),
                                      horizontal_space,
                                      Text(
                                        data.allproducts[index].rating!["count"]
                                            .toString(),
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
                                    data.allproducts[index].category!
                                        .toUpperCase(),
                                    style: hintStyle,
                                  )),
                            ),
                            SizedBox(
                              height: size.height * .01,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                        style: lightStyle.copyWith(fontSize: 15),
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
                              padding:
                                  const EdgeInsets.fromLTRB(21.0, 10, 0, 10),
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'About the product',
                                    style: lightStyle,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(22, 0, 22, 20),
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
                            _buildaddto_cart(context, data.allproducts[index])
                          ]));
                        }),
                  );
          }),
        ],
      ),
    );
  }

  _buildaddto_cart(BuildContext context, Product product) {
    //Size size = MediaQuery.sizeOf(context);
    return Consumer<CartProvider>(builder: (context, cartdata, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildqty(context, product),
          horizontal_space,
          horizontal_space,
          horizontal_space,
          buildAddToCartButton(context, product)
        ],
      );
    });
  }
}
