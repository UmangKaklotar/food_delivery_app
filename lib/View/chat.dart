import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:food_delivery_app/Utils/size.dart';

class Chat extends StatelessWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      heightFactor: MySize.height,
      child: Text("No Chats",
        style: TextStyle(
          color: MyColor.grey,
        ),
      ),
    );
  }
}
