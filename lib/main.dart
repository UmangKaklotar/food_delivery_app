import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/Utils/color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'View/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      theme: ThemeData(
        textTheme: TextTheme(
          bodyText2: GoogleFonts.poppins(color: MyColor.black),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    ),
  );
}
