// ignore_for_file: file_names, prefer_const_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:service_now/User_Logged_In/appointments.dart';
import 'package:service_now/User_Logged_In/mapWithServices.dart';
import 'package:service_now/User_Logged_In/settings.dart';
import 'package:service_now/User_Logged_In/storePage.dart';
import 'package:service_now/User_Logged_In/upcomingEventsScreen.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;

  // a list of screens that I want to navigate through using the bottom navigation bar
  final List<Widget> _screens = [
    UpcomingEventsScreen(),
    Appointments(),
    StorePage(),
    MapWithServiceImages(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: GNav(
        backgroundColor: Colors.white,
        color: Colors.black,
        activeColor: Colors.black,
        tabBackgroundColor: Colors.grey.shade300,
        padding: EdgeInsets.all(18),
        tabs: const [
          GButton(
            gap: 4,
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.edit_calendar,
            text: ' Free Dates',
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
        // this is how i can switch between pages and keep the bottom navigation bar on the screen
        onTabChange: (index) {
          print(index);
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    ));
  }
}
