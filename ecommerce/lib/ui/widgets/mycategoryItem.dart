import 'package:flutter/material.dart';
import '../screens/productsByCategory.dart';
class CategoryItem extends StatelessWidget {
  CategoryItem({Key? key, required this.imageasset, required this.categoryname})
      : super(key: key);
  String imageasset;
  String categoryname;
  TextStyle categorynamestyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 10,
            ),
            Text(
              categoryname,
              style: categorynamestyle,
            ),
          ],
        ),
      ),
    );
  }
}
