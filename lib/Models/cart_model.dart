import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopServices = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Skoda", "assets/skodaService_RESIZED.png", Colors.green],
    ["Mercedes", "assets/mercedesService_RESIZED.png", Colors.yellow],
    ["Hyundai", "assets/hyundaiService_RESIZED.png", Colors.brown],
    ["Volkswagen", "assets/volkswagenService_RESIZED.png", Colors.blue],
  ];

  get shopServices => _shopServices;

  final List _shopMercedes = const [
    // [ itemName, imagePath, color ]
    ["Mercedes1", "assets/mercedesSteeringWheel2.jpg", Colors.green],
    ["Mercedes2", "assets/mercedesSteeringWheel.jpg", Colors.yellow],
    ["Mercedes3", "assets/mercedes3.jpeg", Colors.brown],
    ["Mercedes4", "assets/mercedes4.jpg", Colors.blue],
    ["Mercedes5", "assets/mercedes5.jpg", Colors.blue],
    ["Mercedes6", "assets/mercedes6.jpg", Colors.blue],
    ["Mercedes7", "assets/mercedes7.jpg", Colors.blue],
    ["Mercedes8", "assets/mercedes8.jpg", Colors.blue],
  ];

  get shopMercedes => _shopMercedes;

  final List _shopSkoda = const [
    // [ itemName, imagePath, color ]
    ["Skoda2", "assets/skodaNavigation2.jpg", Colors.yellow],
    ["Skoda3", "assets/skodaNavigation3.jpg", Colors.brown],
    ["Skoda4", "assets/skodaSeat.jpg", Colors.blue],
    ["Skoda5", "assets/skodaTires1.jpg", Colors.blue],
    ["Skoda6", "assets/skodaTires2.jpg", Colors.blue],
    ["Skoda7", "assets/skodaTires3.jpg", Colors.blue],
  ];

  get shopSkoda => _shopSkoda;
}
