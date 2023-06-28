import 'package:flutter/material.dart';
import 'package:myfirst_app/ui/screens/user_screens/submitted_search.dart';
import 'package:provider/provider.dart';

import '../../../constants/global_constants.dart';
import '../../../providers/product_provider.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _controller = TextEditingController();
  late ProductProvider productProvider;

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of<ProductProvider>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(builder: (context, data, child) {
      return Scaffold(
        backgroundColor: scafoldBackground,
        appBar: AppBar(
          backgroundColor: scafoldBackground,
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "Search",
            style: titleStyle,
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
            ),
          ),
        ),
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  height: 60,
                  padding: EdgeInsets.fromLTRB(16, 6, 10, 0),
                  // width: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (searchedCharacter) {
                      _controller.clear();
                      data.getListSearch(searchedCharacter);
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchedforScreen(
                              searchedlist: data.searchedForproducts,
                              searchedfor: searchedCharacter)));
                    },
                    decoration: InputDecoration(
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                      ),
                      hintText: 'Type here',
                      fillColor: Colors.white,
                      filled: true,
                      border: InputBorder.none,
                      hintStyle: lightStyle,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Recent Searches',
                    style: titleStyle,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 150,
                  margin: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black54),
                  child: Center(
                    child: Text(
                      'No recent searches!',
                      style: boldWhite,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    });
  }
}
