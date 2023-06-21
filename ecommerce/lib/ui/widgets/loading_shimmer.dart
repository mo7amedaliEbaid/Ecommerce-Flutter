import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget loadingShimmer() {
  return Shimmer.fromColors(
    baseColor: Colors.grey.shade100,
    highlightColor: Colors.grey[100]!,
    period: const Duration(seconds: 1),
    child: Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.grey.shade100,
            height: 200,
            width: 200,
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            color: Colors.grey.shade100,
            width: 150,
            height: 22,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey.shade100,
            width: 150,
            height: 22,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            color: Colors.grey.shade100,
            width: 150,
            height: 22,
          ),
        ],
      ),
    ),
  );
}
