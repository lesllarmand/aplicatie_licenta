// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:service_now/Models/cart_model.dart';
import 'package:service_now/User_Logged_In/mainNavigationScreen.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/store_SelectedSellerPages/skoda_item_tile.dart';

class SkodaPage extends StatelessWidget {
  const SkodaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // arrow button to redirect to previous page
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded, color: Colors.black),
            onPressed: () {
              nextScreenReplace(context, const MainNavigationScreen());
            }),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Choose from our products:",
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
                  itemCount: value.shopSkoda.length,
                  padding: EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      // how many items to be in each row, I chose 2
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return SkodaItemTile(
                      itemName: value.shopSkoda[index][0],
                      imagePath: value.shopSkoda[index][1],
                      color: value.shopSkoda[index][2],
                    );
                  },
                );
              }),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
