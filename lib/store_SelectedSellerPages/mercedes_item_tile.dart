// ignore_for_file: file_names, prefer_typing_uninitialized_variables, avoid_unnecessary_containers, prefer_const_constructors, deprecated_member_use
import 'package:flutter/material.dart';

class MercedesItemTile extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final color;

  const MercedesItemTile({
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
          //color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // logo for each seller
            SizedBox(height: 10),
            Image.asset(
              imagePath,
              height: 90,
            ),
            SizedBox(height: 3),
            // name of each seller
            SizedBox(height: 9),
            // button to redirect to next page based on seller selected
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Background color
                ),
                onPressed: () {},
                child: const Text("Buy",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
          ],
        ),
      ),
    );
  }
}
