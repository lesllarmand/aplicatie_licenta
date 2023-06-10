// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, avoid_print, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_now/Utils/popularHeroWidget.dart';

class PopularEventsWidget extends StatelessWidget {
  final String event;
  final String when;
  final String where;
  final String image;
  final String about;

  PopularEventsWidget(
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
      child: Stack(
        children: <Widget>[
          Hero(
            tag: image,
            child: Container(
              height: double.infinity,
              width: 320,
              margin: EdgeInsets.fromLTRB(7, 10, 7, 10),
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/$image'),
                ),
              ),
            ),
          ),
          Positioned(
              bottom: 20,
              left: 30,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    event,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text('$when, $where',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold))
                ],
              ))
        ],
      ),
    );
  }
}
