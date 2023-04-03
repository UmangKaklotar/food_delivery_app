import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../Utils/color.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: HomeController.homeController.index.value,
          onTap: HomeController.homeController.pageIndex,
          unselectedItemColor: MyColor.black.withOpacity(0.7),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: MyColor.themeColor,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.house_fill),
              icon: Icon(CupertinoIcons.home),
              label: "Home",
              tooltip: "Home",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.tickets_fill),
              icon: Icon(CupertinoIcons.tickets),
              label: "Offer",
              tooltip: "Offer",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.cart_fill),
              icon: Icon(CupertinoIcons.cart),
              label: "Cart",
              tooltip: "Cart",
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(CupertinoIcons.heart_fill),
              icon: Icon(CupertinoIcons.heart),
              label: "Like",
              tooltip: "Like",
            ),
          ],
        ));
  }
}
