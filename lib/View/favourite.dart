import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/Utils/size.dart';
import 'package:get/get.dart';

import '../Utils/color.dart';
import '../Widget/category_button.dart';

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
                style: TextStyle(fontSize: 18, color: MyColor.black),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => controller.selectCategory('food'),
                      child: categoryButton(title: "food"),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectCategory('fruit'),
                      child: categoryButton(title: "fruit"),
                    ),
                    GestureDetector(
                      onTap: () => controller.selectCategory('vegetable'),
                      child: categoryButton(title: "vegetable"),
                    ),
                  ],
                ),
              ),
              StreamBuilder(
                stream: FirebaseFirestore.instance.collection('foods').doc(controller.category.value).collection(controller.category.value).snapshots(),
                builder: (context, snapshot) {
                  if(snapshot.hasError) {
                    return const Center(child: Text("Something went Wrong!!"),);
                  } else if(snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        List data = snapshot.data!.docs;
                        if(data[index]['fav']) {
                          return Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)
                            ),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              height: MySize.height * 0.1,
                              width: MySize.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 90, child: Image.network(data[index]['img'], height: 60,)),
                                  const SizedBox(width: 10,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("${data[index]['name']}",),
                                      Text("₹ ${data[index]['price']}", style: TextStyle(color: MyColor.grey),),
                                      Text("20 Min || ⭐ 4.6", style: TextStyle(color: MyColor.grey),),
                                    ],
                                  ),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () => controller.updateFavourite(index, data[index]['fav']),
                                    child: Icon(CupertinoIcons.delete, color: MyColor.black.withOpacity(0.7),)
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                      },
                    );
                  }
                }
              ),
            ],
          ),
        );
      }
    );
  }
}
