import 'package:flutter/material.dart';

import '../Utils/color.dart';
import '../Utils/size.dart';

Widget iconWidget({required var icon}) {
  return Container(
    height: MySize.height * 0.06,
    width: MySize.width * 0.12,
    decoration: BoxDecoration(
      color: MyColor.themeColor,
      borderRadius: BorderRadius.circular(15),
    ),
    child: icon,
  );
}