import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../constants/global_constants.dart';
import 'cartscreen.dart';
import 'detailsBody.dart';


class DetailsScreen extends StatelessWidget {
  DetailsScreen({required this.detailsproductid});
  final int detailsproductid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        title: Consumer<CartProvider>(builder: (context,data,child){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back_ios),
              ),
              Text(
                'Product Details',
                style: hintStyle,
              ),
              InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) =>
                            CartPage(listProduct: data.cartlistProduct)));
                  },
                  child: Icon(Icons.shopping_bag)),
            ],
          );
        })


      ),
      body: DetailsBody(selectedproductid:detailsproductid,),
    );
  }}

