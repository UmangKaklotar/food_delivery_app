import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/Widget/snackbar.dart';
import 'package:get/get.dart';

import '../Model/food_model.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  CollectionReference food = FirebaseFirestore.instance.collection('food');
  RxInt index = 0.obs;
  RxString category = "All".obs;

  insertData(Food foods) {
    return food
        .add(foods.toMap())
        .then((value) => print("Value Added..."))
        .catchError((error) => print("Error :: $error"));
  }

  pageIndex(int val) {
    index.value = val;
    update();
  }

  selectCategory(String val) {
    category.value = val;
    update();
  }

  qtyIncrement(String id, int qty) {
    if (qty > 0) qty++;
    return food
        .doc(id)
        .update({'qty': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  qtyDecrement(String id, int qty) {
    if (qty > 1) qty--;
    return food
        .doc(id)
        .update({'qty': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  addCart(context, String id, bool val) {
    snackBar(context, !val ? "Added to Cart..." : "Removed to Cart...");
    return food
        .doc(id)
        .update({'qty': 1, 'cart': !val,})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  updateFavourite(String id, bool val) {
    return food
        .doc(id)
        .update({'fav': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }
}
