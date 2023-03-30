import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:food_delivery_app/Utils/size.dart';
import 'package:food_delivery_app/Widget/icon_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          physics: const BouncingScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget(icon: const Icon(Icons.dehaze_rounded)),
                Text("📍 Surat - 395004", style: TextStyle(fontSize: 18, color: MyColor.grey),),
                iconWidget(icon: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network('https://media.licdn.com/dms/image/D4D03AQGA_uI8GovT3Q/profile-displayphoto-shrink_200_200/0/1680071922583?e=1685577600&v=beta&t=ZKUnyIWjk0D2IY1Qi6HOW135tTVt085H5DrSP5f84fU',
                ),),),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: MyColor.white,
    );
  }
}
