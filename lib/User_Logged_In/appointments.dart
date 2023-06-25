// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service_now/Utils/servicesAppGridMenu.dart';

class Appointments extends StatelessWidget {
  const Appointments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const AppointmentsNavbar(),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headline1,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      const TextSpan(
                          text: 'What ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 45,
                              fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: 'are you looking for? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 45,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Container(
                  height: 56,
                  padding: const EdgeInsets.only(
                    right: 8,
                    left: 16,
                    bottom: 5,
                    top: 6,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[350],
                  ),
                  child: TextField(
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          color: Colors.black,
                        ),
                    cursorHeight: 24,
                    decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                      suffixIconConstraints: const BoxConstraints(
                        maxHeight: 24,
                      ),
                      hintText: 'Search services and features',
                      hintStyle: Theme.of(context).textTheme.headline5,
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                const ServicesGridMenu(),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
