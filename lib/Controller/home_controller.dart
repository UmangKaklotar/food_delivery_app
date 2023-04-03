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
    if (qty > 0) qty.obs.value++;
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(HomeController.homeController.category.value)
        .collection(HomeController.homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'qty': qty.obs.value})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
    update();
  }

  qtyDecrement(int index, int qty) async {
    if (qty > 1) qty.obs.value--;
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(HomeController.homeController.category.value)
        .collection(HomeController.homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'qty': qty.obs.value})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
    update();
  }

  addCart(context, int index, bool val) async {
    snackBar(context, !val ? "Added to Cart..." : "Removed to Cart...");
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(HomeController.homeController.category.value)
        .collection(HomeController.homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'cart': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
    update();
  }

  updateFavourite(int index, bool val) async {
    CollectionReference foods = FirebaseFirestore.instance
        .collection('foods')
        .doc(HomeController.homeController.category.value)
        .collection(HomeController.homeController.category.value);
    var doc_snap = await foods.get();
    var doc_id = doc_snap.docs;
    return foods
        .doc(doc_id[index].id)
        .update({'fav': !val})
        .then((value) => print("Value Updated..."))
        .catchError((error) => print("Error :: $error"));
    update();
  }
}
