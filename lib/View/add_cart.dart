import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/View/food_detail.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../Utils/color.dart';
import '../Utils/size.dart';

class AddCart extends StatelessWidget {
  const AddCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: HomeController(),
        builder: (HomeController controller) {
          return Center(
            child: Column(
              children: [
                Text(
                  "Add to Cart",
                  style: TextStyle(fontSize: 18, color: MyColor.black),
                ),
                const SizedBox(height: 10,),
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('food').where('cart', isEqualTo: true,).snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(child: Text("Something went Wrong!!"),);
                        } else if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              List data = snapshot.data!.docs;
                              if (data[index]['cart']) {
                                return GestureDetector(
                                  onTap: () => Get.to(() => FoodDetails(food: snapshot.data!.docs[index])),
                                  child: Card(
                                    elevation: 3,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25)),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      height: MySize.height * 0.1,
                                      width: MySize.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                              width: 90,
                                              child: Hero(
                                                tag: data[index]['img'],
                                                child: Image.network(
                                                  data[index]['img'],
                                                  height: 60,
                                                ),
                                              )),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${data[index]['name']}",
                                              ),
                                              Text(
                                                "₹ ${data[index]['price'] * data[index]['qty']}",
                                                style: TextStyle(
                                                    color: MyColor.grey),
                                              ),
                                              Text(
                                                "Qty: ${data[index]['qty']}",
                                                style: TextStyle(
                                                    color: MyColor.grey),
                                              ),
                                            ],
                                          ),
                                          const Spacer(),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              GestureDetector(
                                                onTap: () => controller.addCart(
                                                    context,
                                                    snapshot.data!.docs[index].id,
                                                    data[index]['cart']),
                                                child: Icon(
                                                  CupertinoIcons.delete,
                                                  size: 22,
                                                  color: MyColor.black
                                                      .withOpacity(0.7),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () =>
                                                        controller.qtyDecrement(
                                                            snapshot.data!.docs[index].id,
                                                            data[index]['qty']),
                                                    child: Icon(
                                                      Icons.remove_circle,
                                                      color: MyColor.themeColor,
                                                    ),
                                                  ),
                                                  Text(" ${data[index]['qty']} "),
                                                  GestureDetector(
                                                    onTap: () =>
                                                        controller.qtyIncrement(
                                                            snapshot.data!.docs[index].id,
                                                            data[index]['qty']),
                                                    child: Icon(
                                                      CupertinoIcons
                                                          .add_circled_solid,
                                                      color: MyColor.themeColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              }
                            },
                          );
                        }
                      }),
                ),
              ],
            ),
          );
        });
  }
}
