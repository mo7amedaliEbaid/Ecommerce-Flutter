import 'dart:math';
import 'package:flutter/material.dart';

import 'dotsIndicator.dart';

class MyPageView extends StatefulWidget {
  MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}
const SCALE_FRACTION = 0.7;
const FULL_SCALE = 1.0;
const PAGER_HEIGHT = 220.0;
class _MyPageViewState extends State<MyPageView> {
  double viewPortFraction = .9;

  PageController? pageController;

  int currentPage = 1;
  List<Map<String,String>> listOfCharacters = [{'image': "images/splashstore.jpg"},
    {'image': "images/splashstore.jpg",},
    {'image': "images/splashstore.jpg",},
  ];
  double? page = 1.0;
  @override
  void initState() {
    pageController =
        PageController(initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: PAGER_HEIGHT,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is ScrollUpdateNotification) {
            setState(() {
              page = pageController?.page;
            });
          }
          return true;
      },
          child: PageView.builder(
            onPageChanged: (pos) {
              setState(() {
                currentPage = pos;
              });
            },
            physics: ClampingScrollPhysics(),
            controller: pageController,
            itemCount: listOfCharacters.length,
            itemBuilder: (context, index) {
              final scale =
              max(SCALE_FRACTION,
                  (FULL_SCALE - (index - page!).abs()) + .5);
              return MYContainer(
                  listOfCharacters[index]['image']??'images/splashstore.jpg', scale
              );
            }  ),
        ),
    ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child:MyDotsIndicator(dotsindex: pageController!.hasClients?pageController?.page:0,),
        ),
      ],
    );
  }
}
Widget MYContainer(String image,double scale){
return Align(
  alignment: Alignment.center,
  child: Container(
    margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
    height: PAGER_HEIGHT*scale,
    width: 800,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.fill)),
  ),
  );
}