import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/globalConsts.dart';
import '../../../constants/constants.dart';
import '../custom_notchedbottomBar.dart';
class MyBottombar extends StatefulWidget {
  const MyBottombar({Key? key}) : super(key: key);

  @override
  State<MyBottombar> createState() => _MyBottombarState();
}
class _MyBottombarState extends State<MyBottombar> {
  CustomConstants constants=CustomConstants();
  final _pageController = PageController(initialPage: 2);
  int maxCount = 5;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
       children: List.generate(
           constants.bottomBarPages.length, (index) => constants.bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (constants.bottomBarPages.length <= maxCount)
          ? MyAnimatedNotchBottomBar(
          pageController: _pageController,
        color: scafoldBackground,
        showBlurBottomBar: false,
        showShadow: true,
        showLabel: false,
        bottomBarItems: [
          const  MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.category,
                    color: Colors.black,
                  ),
                  activeItem: Icon(Icons.category,color: Colors.white,)),

          const MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.location_on,
                    color: Colors.white,
                  ),
                ),
          const MyBottomBarItem(
                  inActiveItem:Icon(Icons.home_filled,color: Colors.black,),
                  activeItem: Icon(Icons.home_filled,color: Colors.white,)),
          const MyBottomBarItem(
            inActiveItem: Icon(
              Icons.person,
              color: Colors.black,
            ),
            activeItem: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
          const  MyBottomBarItem(
                  inActiveItem: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  activeItem: Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ),
        ],
       onTap: (index) {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 10),
            curve: Curves.easeIn,
          );
        }
        ) : null,
    );
  }
}

