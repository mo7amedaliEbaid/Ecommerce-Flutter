import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/global_constants.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../models/products_model.dart';
import '../../providers/favourited_provider.dart';
import '../screens/details_screen.dart';
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
              Consumer<CartProvider>(builder: (context,cartdata,_){
                return  ElevatedButton(
                  onPressed: () {
                    print("Llllllllllllllllllllllllllllllllllllllllllllllllll");
                    cartdata.add(widget.chosenproduct, 1);
                    cartdata.addItemToCart(widget.chosenproduct);
                    /*setState(() {
                    _cart = cartProvider.cartlistProduct;
                  });*/
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    minimumSize: MaterialStateProperty.all(Size(70, 42)),
                    maximumSize: MaterialStateProperty.all(Size(137, 60)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.shopping_bag,
                        color: Colors.white,
                        size: 16,
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Add to Cart',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                );
              }),
              vertical_space,
              Consumer<FavouritesProvider>(builder: (context,favdata,_){
                return Container(
                  width: 30,
                  height: 44,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: isPressed
                      ? InkWell(
                      onTap: () {
                        favdata.remove(widget.chosenproduct);
                        setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: pressedIcon)
                      : InkWell(
                      onTap: () {
                        favdata.add(item: widget.chosenproduct);
                       setState(() {
                          isPressed = !isPressed;
                        });
                      },
                      child: unpressedIcon),
                );
              })

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

