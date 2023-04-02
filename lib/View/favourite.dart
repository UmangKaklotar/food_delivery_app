import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:get/get.dart';

import '../Utils/color.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Center(
          child: Column(
            children: [
              Text(
                "My Favourite",
                style: TextStyle(fontSize: 18, color: MyColor.grey),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, index) {},
                ),
                ),
            ],
          ),
        );
      }
    );
  }
}
