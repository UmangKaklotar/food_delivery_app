class Food{
  String? name, img;
  int? price, qty;
  bool? cart, fav;

  Food({required this.name, required this.img, required this.price, required this.qty, required this.cart, required this.fav});

  Food.fromMap(Map<String, dynamic> map) {
    name = map[name];
    img = map[img];
    price = map[price];
    qty = map[qty];
    cart = map[cart];
    fav = map[fav];
  }

  Map<String, dynamic> toMap() => {
    'name': name,
    'img': img,
    'price': price,
    'qty': qty,
    'cart': cart,
    'fav': fav,
  };
}