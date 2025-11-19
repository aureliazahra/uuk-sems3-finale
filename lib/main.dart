import 'package:flutter/material.dart';
import 'package:uuk_final_sems3/screen/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jelajah Nusantara',
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
