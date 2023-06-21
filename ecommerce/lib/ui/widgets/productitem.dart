import 'package:flutter/material.dart';
import 'package:myfirst_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';
import '../../models/products_model.dart';
import '../../providers/favourited_provider.dart';
import '../../providers/product_provider.dart';
import '../screens/drtailsScreen.dart';

class ProductItem extends StatefulWidget {
  ProductItem({
    Key? key,
    required this.productImage,
    required this.productTitle,
    required this.productPrice,
    required this.previousPrice,
    required this.productId,
    required this.productdescription,
    required this.productrating,
    required this.productcategory,
  }) : super(key: key);

  // final List<Product> news;
  final String productImage;
  final String productTitle;
  final double productPrice;
  final double previousPrice;
  final int productId;
  final String productdescription;
  final Map productrating;
  final String productcategory;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  late ProductProvider productProvider;
  late List<Product> searchedForproducts;
  late FavouritesProvider favouritesProvider;
  late CartProvider cartProvider;
  List<Product> _favourites = [];
  List<Product> _cart = [];
  late Product product;
  late Product cartproduct;
  late Product detailsproduct;
  late Product _selectedproduct;
  Icon pressedIcon = Icon(
    Icons.favorite,
    color: Colors.black,
  );
  Icon unpressedIcon = Icon(Icons.favorite_border);
  bool isPressed = false;

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    favouritesProvider =
        Provider.of<FavouritesProvider>(context, listen: false);
    cartProvider = Provider.of<CartProvider>(context, listen: false);

    _favourites = favouritesProvider.favouritelistProduct;
    _cart = cartProvider.cartlistProduct;

    cartproduct = Product(
        id: widget.productId,
        title: widget.productTitle,
        price: widget.productPrice,
        description: widget.productdescription,
        image: widget.productImage,
        rating: widget.productrating,
        category: widget.productcategory);
    product = Product(
        id: widget.productId,
        title: widget.productTitle,
        price: widget.productPrice,
        image: widget.productImage,
        description: widget.productdescription,
        rating: widget.productrating,
        category: widget.productcategory);
    super.initState();
  }

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
                    detailsproductid: widget.productId,
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
                      image: NetworkImage(widget.productImage),
                      fit: BoxFit.contain)),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: 150,
            height: 47,
            child: Text(
              widget.productTitle,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Text(
            '${widget.productPrice} KWD',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          PreviousPrice(widget.previousPrice),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  cartProvider.add(cartproduct, 1);
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
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                width: 30,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: isPressed
                    ? InkWell(
                        onTap: () {
                          favouritesProvider.remove(product);
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: pressedIcon)
                    : InkWell(
                        onTap: () {
                          favouritesProvider.add(item: product);
                          setState(() {
                            isPressed = !isPressed;
                          });
                        },
                        child: unpressedIcon),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget PreviousPrice(double price) {
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
