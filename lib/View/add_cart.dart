import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/home_controller.dart';
import '../Utils/color.dart';
import '../Utils/size.dart';
import '../Widget/category_button.dart';

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
                Expanded(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance.collection('foods').doc(controller.category.value).collection(controller.category.value).snapshots(),
                      builder: (context, snapshot) {
                        if(snapshot.hasError) {
                          return const Center(child: Text("Something went Wrong!!"),);
                        } else if(snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (context, index) {
                              List data = snapshot.data!.docs;
                              if(data[index]['cart']) {
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
                                            Text("Price ${data[index]['price']}", style: TextStyle(color: MyColor.grey),),
                                            Text("Qty: ${data[index]['qty']}", style: TextStyle(color: MyColor.grey),),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                                onTap: () => controller.removeCart(context, index, data[index]['fav']),
                                                child: Icon(CupertinoIcons.delete, color: MyColor.black.withOpacity(0.7),),
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () => controller.qtyDecrement(index, data[index]['price'], data[index]['qty']),
                                                  child: Icon(Icons.remove_circle, color: MyColor.black.withOpacity(0.7),),
                                                ),
                                                Text(" ${data[index]['qty']} "),
                                                GestureDetector(
                                                  onTap: () => controller.qtyIncrement(index, data[index]['price'], data[index]['qty']),
                                                  child: Icon(CupertinoIcons.add_circled_solid, color: MyColor.black.withOpacity(0.7),),
                                                ),
                                              ],
                                            ),
                                          ],
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
                ),
              ],
            ),
          );
        }
    );
  }
}
