import 'package:donut_app/pages/cart.dart';
import 'package:donut_app/pages/home.dart';
import 'package:donut_app/pages/profile.dart';
import 'package:donut_app/pages/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Home(),
      theme: ThemeData(primarySwatch: Colors.pink),
      routes : {
        '/cart': (context) => const CartPage(),
        '/profile' : (context) => const ProfilePage(),
        '/settings' : (context) => const Settings()
      }
    );
  }
}
