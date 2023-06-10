// ignore_for_file: file_names, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_now/Utils/popularHeroWidget.dart';

class DiscoverWidget extends StatelessWidget {
  final String event;
  final String when;
  final String where;
  final String image;
  final String about;

  DiscoverWidget(
      {required this.event,
      required this.when,
      required this.where,
      required this.image,
      required this.about});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => PopularHeroWidget(
                  event: event,
                  when: when,
                  where: where,
                  image: image,
                  about: about))),
      child: Container(
        height: double.infinity,
        width: 150,
        margin: EdgeInsets.symmetric(horizontal: 7, vertical: 5),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/$image'),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: SizedBox(),
            ),
            Text(
              event,
              style: TextStyle(
                color: Colors.white,
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$when, $where',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
