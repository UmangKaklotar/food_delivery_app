import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:food_delivery_app/View/bottom_navigation_bar.dart';
import 'package:food_delivery_app/Widget/category_button.dart';
import 'package:food_delivery_app/Widget/icon_widget.dart';
import 'package:get/get.dart';

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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    Row(
                      children: [
                       categoryButton(title: "All"),
                       categoryButton(title: "title"),
                       categoryButton(title: "title"),
                       categoryButton(title: "title"),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
