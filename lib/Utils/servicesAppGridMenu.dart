// ignore_for_file: file_names, deprecated_member_use, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:service_now/Models/doctor.dart';

class ServicesGridMenu extends StatelessWidget {
  const ServicesGridMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 8,
      ),
      padding: EdgeInsets.zero,
      itemCount: doctorMenu.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          child: Container(
            constraints: const BoxConstraints(
              maxHeight: 90,
            ),
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(
                    minHeight: 69,
                    minWidth: 56,
                    maxHeight: 69,
                    maxWidth: 69,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          'assets/carParts/${doctorMenu[index].image}'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Expanded(
                  child: Text(
                    doctorMenu[index].name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
