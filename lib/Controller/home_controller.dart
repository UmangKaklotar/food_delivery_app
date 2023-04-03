import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery_app/Widget/snackbar.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  RxInt index = 0.obs;
  RxString category = "food".obs;

  pageIndex(int val) {
    index.value = val;
    update();
  }

  selectCategory(String val) {
    category.value = val;
    update();
  }

  qtyIncrement(int index, int qty) async {
    if (qty > 0) qty++;
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(homeController.category.value)
        .collection(homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    update();
    return foods
        .doc(doc_id[index].id)
        .update({'qty': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  qtyDecrement(int index, int qty) async {
    if (qty > 1) qty--;
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(homeController.category.value)
        .collection(homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    update();
    return foods
        .doc(doc_id[index].id)
        .update({'qty': qty})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  addCart(context, int index, bool val) async {
    snackBar(context, !val ? "Added to Cart..." : "Removed to Cart...");
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(homeController.category.value)
        .collection(homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'qty': 1, 'cart': !val,})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }

  updateFavourite(int index, bool val) async {
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(homeController.category.value)
        .collection(homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'fav': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
  }
}
