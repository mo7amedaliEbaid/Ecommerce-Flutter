import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myfirst_app/constants/app_constants.dart';

import 'dotsIndicator_widget.dart';

class MyPageView extends StatefulWidget {
  MyPageView({Key? key}) : super(key: key);

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  double viewPortFraction = .9;
  PageController? pageController;
  int currentPage = 1;
  double? page = 1;

  @override
  void initState() {
    pageController = PageController(
        initialPage: currentPage, viewportFraction: viewPortFraction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: AppConstants.PAGER_HEIGHT,
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
                itemCount: 3,
                itemBuilder: (context, index) {
                  final scale = max(AppConstants.SCALE_FRACTION,
                      (AppConstants.FULL_SCALE - (index - page!).abs()) + .5);
                  return _buildmycontainer(AppConstants.pageviewimage, scale);
                }),
          ),
        ),
        Positioned(
          bottom: 40,
          left: 0,
          right: 0,
          child: MyDotsIndicator(
            pageController!.hasClients ? pageController?.page?.round() : 0,
          ),
        ),
      ],
    );
  }

  Widget _buildmycontainer(String image, double scale) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
        height: AppConstants.PAGER_HEIGHT * scale,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
      ),
    );
  }
}
