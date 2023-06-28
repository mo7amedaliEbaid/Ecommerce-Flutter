import 'package:flutter/material.dart';

import '../../../constants/global_constants.dart';
Widget MySeparator(BuildContext context){
  Size size=MediaQuery.sizeOf(context);
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        color: Colors.black,
        height: 2,
        width: size.width * 0.4,
      ),
      SizedBox(
        width: 5,
      ),
      Text(
        'OR',
        style: bigStyle,
      ),
      SizedBox(
        width: 5,
      ),
      Container(
        color: Colors.black,
        height: 2,
        width: size.width * 0.4,
      ),
    ],
  );
}