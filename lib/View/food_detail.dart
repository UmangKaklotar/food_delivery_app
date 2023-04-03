import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/Utils/size.dart';
import 'package:get/get.dart';

import '../Utils/color.dart';
import '../Widget/icon_widget.dart';

class FoodDetails extends StatelessWidget {
  QueryDocumentSnapshot food;
  int index;
  FoodDetails({Key? key, required this.food, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder(
          init: HomeController(),
          builder: (HomeController controller) {
            return SizedBox(
              height: MySize.height,
              width: MySize.width,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: iconWidget(icon: Icon(CupertinoIcons.back, color: MyColor.white), color: MyColor.white.withOpacity(0.2)),
                        ),
                        Text(
                          "Food Details",
                          style: TextStyle(fontSize: 18, color: MyColor.white),
                        ),
                        iconWidget(icon: (food['fav'])
                            ? Icon(CupertinoIcons.heart_fill, color: MyColor.red,)
                            : Icon(CupertinoIcons.heart, color: MyColor.white,), color: MyColor.white.withOpacity(0.2))
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      height: MySize.height * 0.7,
                      width: MySize.width,
                      decoration: BoxDecoration(
                        color: MyColor.white,
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(50)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 100),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    food['name'],
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: MyColor.black,
                                        fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "\$ ${food['price']}",
                                    style: TextStyle(
                                        fontSize: 25,
                                        color: MyColor.themeColor,
                                    ),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Container(
                                width: MySize.width * 0.3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: MyColor.themeColor,
                                    boxShadow: [
                                      BoxShadow(
                                          color: MyColor.black.withOpacity(0.1),
                                          spreadRadius: 0.5,
                                          blurRadius: 2,
                                          offset: const Offset(0, 3))
                                    ]),
                                child: Center(
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconButton(
                                          onPressed: () => controller.qtyDecrement(index, food['qty']),
                                          icon: Icon(
                                            Icons.remove,
                                            color: MyColor.white,
                                          )),
                                      Text(
                                        "${food['qty']}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: MyColor.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      IconButton(
                                          onPressed: () => controller.qtyIncrement(index, food['qty']),
                                          icon: Icon(
                                            Icons.add,
                                            color: MyColor.white,
                                          )),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "⌚ 20 Min",
                                style: TextStyle(
                                    color: MyColor.grey, fontSize: 16),
                              ),
                              Text(
                                "🔥 100 Kcal",
                                style: TextStyle(
                                    color: MyColor.grey, fontSize: 16),
                              ),
                              Text(
                                "⭐ 4.5",
                                style: TextStyle(
                                    color: MyColor.grey, fontSize: 16),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text("About food",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                          ),
                          Text(
                              "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. ",
                              style: TextStyle(color: MyColor.grey),),
                          const Spacer(),
                          InkWell(
                            onTap: () => controller.addCart(context, index, food['cart']),
                            child: Container(
                              height: 55,
                              width: MySize.width,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: MyColor.themeColor,
                                  boxShadow: [
                                    BoxShadow(
                                        color: MyColor.black.withOpacity(0.1),
                                        spreadRadius: 0.5,
                                        blurRadius: 2,
                                        offset: const Offset(0, 3))
                                  ]),
                              child: Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: MyColor.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: MySize.width * 0.20,
                    top: MySize.height * 0.13,
                    child: Container(
                      alignment: Alignment.center,
                      height : 160,
                      child: Hero(
                        tag: food['img'],
                        child: Image.network("${food['img']}"),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
      backgroundColor: MyColor.themeColor,
    );
  }
}

