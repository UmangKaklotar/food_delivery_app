import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:food_delivery_app/Utils/size.dart';
import 'package:food_delivery_app/View/home_screen.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/image/splash.png',
              width: MySize.width * 0.7,
            ),
            const SizedBox(height: 40),
            Text(
              "Fast Delivery at\nYour Doorstep",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColor.white,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25),
            Text(
              "Home Delivery and Online Reservation\nSystem for restaurants & Cafe",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: MyColor.white,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
      backgroundColor: MyColor.themeColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: GestureDetector(
        onTap: () => Get.off(() => const HomeScreen()),
        child: Container(
          margin: const EdgeInsets.all(15),
          height: 50,
          width: MySize.width,
          decoration: BoxDecoration(
            color: MyColor.white,
            borderRadius: BorderRadius.circular(15),
          ),
          alignment: Alignment.center,
          child: Text(
            "Let's Explore",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: MyColor.themeColor,
            ),
          ),
        ),
      ),
    );
  }
}
