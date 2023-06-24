import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:myfirst_app/ui/widgets/favicon_widget.dart';
import 'package:provider/provider.dart';
import '../../models/products_model.dart';
import '../../providers/favourites_provider.dart';
import '../screens/details_screen.dart';
import 'addtocart_button_widget.dart';
class ProductItem extends StatefulWidget {
  ProductItem(this.chosenproduct, this._previousprice);
 final Product chosenproduct;
 final double _previousprice;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    detailsproductid: widget.chosenproduct.id!,
                  ),
                ),
              );
            },
            child: Container(
              height: size.height * 0.25,
              width: size.width * 0.43,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  image: DecorationImage(
                      image: NetworkImage(widget.chosenproduct.image!),
                      fit: BoxFit.contain)),
            ),
          ),
          vertical_space,
          Container(
            width: 150,
            height: 47,
            child: Text(
              widget.chosenproduct.title!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: meduimStyl.copyWith(fontWeight: FontWeight.w700)
            ),
          ),
          Text(
            '${widget.chosenproduct.price} KWD',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          widget._previousprice==0?Container():SizedBox(
            height: 5,
          ),
          _buildprevios_price(widget._previousprice),
          Row(
            children: [

                 buildAddToCartButton(context,widget.chosenproduct),
              horizontal_space,

              buildFavicon(context, widget.chosenproduct, false)

            ],
          ),
        ],
      ),
    );
  }

  _buildprevios_price(double price){
    if (price == 0) {
      return Text('');
    } else {
      return Text(
        '$price',
        style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }
}

