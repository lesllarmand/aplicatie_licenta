// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_now/Models/cart_model.dart';
import 'package:service_now/Utils/storeServices_item_tile.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Choose from a variety of sellers:",
                style: TextStyle(
                    fontFamily: "PlayfairDisplay",
                    fontSize: 33,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(
                thickness: 2,
              ),
            ),
            Expanded(
              child: Consumer<CartModel>(builder: (context, value, child) {
                return GridView.builder(
                  itemCount: value.shopServices.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // how many items to be in each row, I chose 2
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return StoreServicesItemTile(
                      itemName: value.shopServices[index][0],
                      imagePath: value.shopServices[index][1],
                      color: value.shopServices[index][2],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
