import 'package:flutter/cupertino.dart';

Widget categoryButton({required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
    child: Text(title,
      style: const TextStyle(fontSize: 16),
    ),
  );
}