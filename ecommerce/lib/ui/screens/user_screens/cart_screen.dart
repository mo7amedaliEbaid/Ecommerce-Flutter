import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/widgets/cart_widgets/shippingaddress_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/products_model.dart';
import '../../../providers/cart_provider.dart';
import '../../../services/localization.dart';
import '../../widgets/cart_widgets/buildcart_product_widget.dart';
import '../../widgets/app_widgets/buildtitle_widget.dart';
import '../../widgets/cart_widgets/checkoutbutton_widget.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late CartProvider cartProvider;

  @override
  void initState() {
    super.initState();
    cartProvider = Provider.of<CartProvider>(context, listen: false);
    cartProvider.getUpdatedSessionCartData();
  }

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
            AppLocalization.of(context)
                .getTranslatedValue("cart")
                .toString(),
            style: titleStyle,
          ),
          leading: Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                )),
          ),
        ),
        body: Consumer<CartProvider>(
          builder: (context, data, _) {
            return data.cartlist.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .2,
                          width: MediaQuery.of(context).size.width * .25,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("${AppConstants.emptycart}"))),
                        ),
                        Text(
                          "Your Cart is Empty",
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                : Container(
                    padding: const EdgeInsets.all(10),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        buildTitle(context),
                       vertical_space,
                       vertical_space,
                        _buildListProcduct(context),
                        ShippingAdress(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushReplacementNamed(AppConstants.bottombar_route);
                          },
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                'Change'.toUpperCase(),
                                style: boldWhite
                              ),
                            ),
                          ),
                        ),
                       vertical_space,
                       vertical_space,
                        buildTotalPrice(),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade600,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                              child: Text(
                                'Continue Shopping'.toUpperCase(),
                                style:boldWhite
                              ),
                            ),
                          ),
                        ),
                        vertical_space,
                        vertical_space,
                        CheckoutWidget(),
                        vertical_space,
                        vertical_space,
                        Text(
                          "Note: Shipping fees, Customs, VAT and Taxes shall be calculated at the checkout page, if applicable.",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w500),
                        ),
                        vertical_space,
                        vertical_space,
                      ]),
                    ),
                  );
          },
        ));
  }



  _buildListProcduct(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, data, _) {
        return Column(
          children: [
            ...data.cartlist.map((e) => buildProductCard(context, e)),
            SizedBox(
              height: 25,
            )
          ],
        );
      },
    );
  }


  buildTotalPrice() {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return data.cartlist.length == 0
          ? Container()
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Products Total",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          "${data.calculateGrandTotal()} KWD",

                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Discount",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(" -2.000 KWD",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SubTotal",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                          " ${data.calculateGrandTotal() - 2.000} KWD",

                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            );
    });
  }
}


