import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:food_delivery_app/Widget/icon_widget.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
            init: HomeController(),
            builder: (HomeController controller) {
              return ListView(
                padding: const EdgeInsets.all(20),
                physics: const BouncingScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      iconWidget(icon: const Icon(Icons.dehaze_rounded)),
                      Text(
                        "📍 Surat - 395004",
                        style: TextStyle(fontSize: 18, color: MyColor.grey),
                      ),
                      iconWidget(
                        icon: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            'https://media.licdn.com/dms/image/D4D03AQGA_uI8GovT3Q/profile-displayphoto-shrink_200_200/0/1680071922583?e=1685577600&v=beta&t=ZKUnyIWjk0D2IY1Qi6HOW135tTVt085H5DrSP5f84fU',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Hi Umang",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: MyColor.themeColor,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Find Your Food",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: MyColor.black,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const CupertinoSearchTextField(),
                  const SizedBox(height: 10),
                ],
              );
            }),
      ),
      backgroundColor: MyColor.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(CupertinoIcons.cart_fill),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            currentIndex: homeController.index.value,
            onTap: homeController.pageIndex,
            elevation: 1,
            unselectedItemColor: MyColor.black,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: MyColor.themeColor,
            selectedLabelStyle: const TextStyle(fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontSize: 12),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.house_fill),
                icon: Icon(CupertinoIcons.home),
                label: "Home",
                tooltip: "Home",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
                icon: Icon(CupertinoIcons.chat_bubble_2),
                label: "Chat",
                tooltip: "Chat",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.bell_fill),
                icon: Icon(CupertinoIcons.bell),
                label: "Bell",
                tooltip: "Bell",
              ),
              BottomNavigationBarItem(
                activeIcon: Icon(CupertinoIcons.heart_fill),
                icon: Icon(CupertinoIcons.heart),
                label: "Like",
                tooltip: "Like",
              ),
            ],
          )),
    );
  }
}
