import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Controller/home_controller.dart';
import 'package:food_delivery_app/Utils/size.dart';
import 'package:get/get.dart';

import '../Utils/color.dart';
import '../Widget/category_button.dart';
import '../Widget/icon_widget.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomeController(),
      builder: (HomeController controller) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget(icon: Icon(Icons.dehaze_rounded, color: MyColor.white,)),
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
            const SizedBox(height: 15),
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
            const SizedBox(height: 5),
            const CupertinoSearchTextField(),
            const SizedBox(height: 10),
            Row(
              children: [
                GestureDetector(
                  onTap: () => controller.selectCategory('All'),
                  child: categoryButton(title: "All"),
                ),
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
            StreamBuilder(
              stream: FirebaseFirestore.instance.collection('foods').doc(controller.category.value).collection(controller.category.value).snapshots(),
              builder: (context, snapshot) {
                if(snapshot.hasError) {
                  return const Center(child: Text("Something went Wrong!!"),);
                } else if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 10),
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1/1.25,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      List data = snapshot.data!.docs;
                      return Card(
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: (data[index]['fav'])
                                    ? Icon(CupertinoIcons.heart_fill, color: MyColor.red,)
                                    : Icon(CupertinoIcons.heart, color: MyColor.grey,),
                                  splashRadius: 5,
                                  onPressed: () => controller.updateFavourite(index, data[index]['fav']),
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                height : 60,
                                child: Image.network("${data[index]['img']}"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text("${data[index]['name']}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("20 Min"),
                                    Text("⭐ 4.6"),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text("₹ ${data[index]['price']}"),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: GestureDetector(
                                  onTap: () => controller.addCart(context, index, data[index]['cart']),
                                  child: Container(
                                    height: MySize.height * 0.046,
                                    width: MySize.width * 0.1,
                                    decoration: BoxDecoration(
                                      color: MyColor.themeColor,
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                                    ),
                                    child: Icon(CupertinoIcons.add, color: MyColor.white,),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ],
        );
      }
    );
  }
}
