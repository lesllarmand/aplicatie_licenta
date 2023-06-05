// ignore_for_file: file_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.grey.shade300,
        padding: EdgeInsets.all(18),
        onTabChange: (index) {
          print(index);
        },
        tabs: const [
          GButton(
            gap: 4,
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.search_sharp,
            text: 'Search',
          ),
          GButton(
            icon: Icons.shopping_cart_sharp,
            text: ' Store',
          ),
          GButton(
            icon: Icons.location_on,
            text: ' Map',
          ),
          GButton(
            icon: Icons.settings,
            text: ' Settings',
          ),
        ],
      ),
    );
  }
}
