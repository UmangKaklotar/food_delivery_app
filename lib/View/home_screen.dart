import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/View/add_cart.dart';
import 'package:food_delivery_app/View/bottom_navigation_bar.dart';
import 'package:food_delivery_app/View/offer.dart';
import 'package:food_delivery_app/View/favourite.dart';
import 'package:get/get.dart';

import 'home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: HomeController(),
            builder: (HomeController controller) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: IndexedStack(
                  index: controller.index.value,
                  children: const [
                    Home(),
                    Chat(),
                    AddCart(),
                    Favourite(),
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: const BottomBar(),
    );
  }
}
