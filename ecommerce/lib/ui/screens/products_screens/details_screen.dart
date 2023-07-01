import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/ui/screens/user_screens/cart_screen.dart';
import 'package:myfirst_app/ui/widgets/app_widgets/cartbadge_widget.dart';
import 'package:provider/provider.dart';
import '../../../constants/global_constants.dart';
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
          color: Colors.black,
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey.shade300,
        elevation: 0,
        title: Consumer<CartProvider>(builder: (context,data,child){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
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
              Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: buildcart_badge(),
              )
            ],
          );
        })


      ),
      body: DetailsBody(selectedproductid:detailsproductid,),
    );
  }}

