import 'package:flutter/material.dart';
import 'package:prectical_two/screens/calculate_page.dart';
import 'package:prectical_two/screens/home_page.dart';
import 'package:prectical_two/screens/splash_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "splash_screen",
      routes: {
        "splash_screen": (context) => const SplashScreen(),
        "/": (context) => const HomePage(),
        "calculate_page": (context) => const CalculatePage(),
      },
    ),
  );
}
