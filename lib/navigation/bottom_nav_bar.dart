import 'package:flutter/material.dart';
import 'package:favorite_movies/screens/favorites_screen.dart';
import 'package:favorite_movies/screens/home_screen.dart';
import 'package:favorite_movies/screens/search_screen.dart';
import 'package:favorite_movies/screens/settings_screen.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentPageIndex = 0;
  List screens = const[
    HomeScreen(),
    Search(),
    Favorites(),
    Settings(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 25,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: currentPageIndex,
            onTap: (index) => setState(() {
              currentPageIndex = index;
            }),
            type: BottomNavigationBarType.fixed,
            selectedIconTheme: const IconThemeData(
              size: 32,
              color: Colors.deepPurpleAccent,
            ),
            unselectedIconTheme: const IconThemeData(
              size: 32,
              color: Colors.black12,
            ),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedLabelStyle: const TextStyle(
                fontSize: 15,
                color: Colors.deepPurpleAccent,
            ),
            items: const[
              BottomNavigationBarItem(icon: Icon(Icons.home_rounded), label: "Home"),
              BottomNavigationBarItem(icon: Icon(Icons.search_rounded), label: "Search"),
              BottomNavigationBarItem(icon: Icon(Icons.bookmark_rounded), label: "Favorites"),
              BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: "Settings"),
            ],
          ),
        ),
      ),
      body: screens[currentPageIndex],
    );
  }
}
