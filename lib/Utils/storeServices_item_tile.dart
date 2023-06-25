// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use, unused_import
import 'package:flutter/material.dart';
import 'package:service_now/Utils/next_screen.dart';
import 'package:service_now/authentification_Pages/welcome_page.dart';
import 'package:service_now/store_SelectedSellerPages/mercedes.dart';
import 'package:service_now/store_SelectedSellerPages/skoda.dart';

class StoreServicesItemTile extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final color;

  const StoreServicesItemTile({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // logo for each seller
            SizedBox(height: 10),
            Image.asset(
              imagePath,
              height: 70,
            ),
            SizedBox(height: 3),
            // name of each seller
            Text(itemName),
            SizedBox(height: 9),
            // button to redirect to next page based on seller selected
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                ),
                onPressed: () {
                  if (itemName == "Skoda") {
                    nextScreenReplace(context, const SkodaPage());
                  }
                  if (itemName == "Mercedes") {
                    nextScreenReplace(context, const MercedesPage());
                  }
                  if (itemName == "Hyundai") {
                    //nextScreenReplace(context, const WelcomePageScreen());
                  }
                  if (itemName == "Volkswagen") {
                    // nextScreenReplace(context, const WelcomePageScreen());
                  }
                },
                child: const Text("Select",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
