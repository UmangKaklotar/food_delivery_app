import 'package:flutter/material.dart';

import '../Utils/size.dart';

Widget iconWidget({required var icon, required Color color}) {
  return Container(
    height: MySize.height * 0.05,
    width: MySize.width * 0.10,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(12),
    ),
    child: icon,
  );
}