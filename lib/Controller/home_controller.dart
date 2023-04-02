import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../Model/food_model.dart';

class HomeController extends GetxController {
  static HomeController homeController = Get.put(HomeController());
  CollectionReference favouriteFood = FirebaseFirestore.instance.collection('favouriteFood');
  RxInt index = 0.obs;
  RxString category = "All".obs;

  pageIndex(int val) {
    index.value = val;
    update();
  }

  selectCategory(String val) {
    category.value = val;
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
  }

  insertFoodFav(QueryDocumentSnapshot data) async {
    var doc_snap = await favouriteFood.get();
    var doc_id = doc_snap.docs;
    if(data['fav'] == false) {
      Food food = Food(name: data['name'], img: data['img'], price: data['price'], qty: data['qty'], cart: data['cart'], fav: data['fav']);
      for(int i = 0 ; i < doc_id.length ; i++) {
        if(doc_id[i]['name'] != data['name']) {
          return favouriteFood
              .add(food.toMap())
              .then((value) => print("Value Added..."))
              .catchError((error) => print("Error :: $error"));
        }
      }
    }
  }

}
