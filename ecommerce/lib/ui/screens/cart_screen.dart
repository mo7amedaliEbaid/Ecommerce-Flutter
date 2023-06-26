import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfirst_app/constants/app_constants.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/ui/widgets/shippingaddress_widget.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/products_model.dart';
import '../../providers/cart_provider.dart';

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
            'Cart',
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
                      child: Container(
                        width: 500,
                        child: Column(children: [
                          buildTitle(),
                          const SizedBox(
                            height: 20,
                          ),
                          buildListProcduct(context),
                          ShippingAdress(),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Change'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
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
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Center(
                                child: Text(
                                  'Proceed to checkout'.toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Note: Shipping fees, Customs, VAT and Taxes shall be calculated at the checkout page, if applicable.",
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ]),
                      ),
                    ),
                  );
          },
        ));
  }

  buildTitle() {
    return Consumer<CartProvider>(
      builder: (context, data, _) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Cart",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.left,
            ),
            Row(
              children: [
                Text(
                  "${data.cartlist.length} products".toUpperCase(),
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 80,
                ),
                Text(
                  "This is Gift",
                  style: lightStyle,
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  color: Colors.black,
                  width: 25,
                  height: 25,
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            DialogExample()
          ],
        );
      },
    );
  }

  buildListProcduct(BuildContext context) {
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

  buildProductCard(BuildContext context, Product product) {
    return Consumer<CartProvider>(builder: (context, cartdata, _) {
      return Container(
        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(product.image!),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
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
                    Text(
                      "Quantity : ${product.quantity}",
                      // "test",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${product.price! * product.quantity}  KWD",
                      // "test",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
                InkWell(
                  onTap: () {
                    cartdata.removeSelectedItemFromCart(product.id!);
                  },
                  child: const Icon(
                    Icons.clear,
                    size: 22,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    });
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
                          " ${data.calculateGrandTotal() - 2000} KWD",

                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ],
            );
    });
  }

  buildButtons() {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return data.cartlist.length == 0
          ? Container()
          : ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40)),
              child: const Text("Buy"));
    });
  }
}

class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(builder: (context, cartdata, _) {
      return TextButton(
        onPressed: () async {
          SharedPreferences preferences = await SharedPreferences.getInstance();

          showDialog<String>(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Really want to proceed ?"),
                content: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      height: 200,
                      child: ListView.separated(
                        separatorBuilder: (_, i) => Divider(),
                        itemCount: cartdata.cartlist.length,
                        itemBuilder: (_, index) {
                          return ListTile(
                            leading: Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          cartdata.cartlist[index].image!))),
                            ),
                            title: Text(
                              cartdata.cartlist[index].title!,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                            subtitle: Text(
                              "\$. " +
                                  NumberFormat.currency(
                                          decimalDigits: 0, symbol: '')
                                      .format(cartdata.cartlist[index].price) +
                                  " x " +
                                  cartdata.cartlist[index].quantity.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 11),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      preferences.getString("username")!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      preferences.getString("email")!,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Total \$. " +
                          NumberFormat.currency(decimalDigits: 0, symbol: '')
                              .format(cartdata.grandTotal),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () => cartdata.transactionCompleted(context),
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Text('Show Dialog'),
      );
    });
  }
}
