import 'package:flutter/material.dart';
import '../../constants/global_constants.dart';
import '../screens/productsByCategory.dart';

Widget CategoryItem(
    BuildContext context, String imageasset, String categoryname) {
  return InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ProductsbyCategory(
                selectedCategory: categoryname,
              )));
    },
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 10, 5),
      child: Column(
        children: [
          Container(
            width: 160,
            height: 180,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(imageasset), fit: BoxFit.fill)),
          ),
         vertical_space,
          Text(
            categoryname.toUpperCase(),
            style: categorynamestyle,
          ),
        ],
      ),
    ),
  );
}
