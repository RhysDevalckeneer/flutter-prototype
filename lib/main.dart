import 'package:flutter/material.dart';

import 'package:favorite_movies/navigation/bottom_nav_bar.dart';
import 'package:flutter/services.dart';
// import 'package:favorite_movies/screens/details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}

