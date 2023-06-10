// ignore_for_file: file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:service_now/Utils/discoverEvent.dart';
import 'package:service_now/Utils/popularEvent.dart';

class UpcomingEventsScreen extends StatelessWidget {
  const UpcomingEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2f6fa),
      body: Center(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Text(
                "Upcoming Popular Events",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  height: 260,
                  width: double.infinity,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      PopularEventsWidget(
                        event: '2023 BMW i7 Show',
                        when: 'July 25th, 2023',
                        where: 'BMW Service Timisoara',
                        image: '2023_bmw_i7.jpg',
                        about:
                            'Latest BMW i7 Model Reveal. Want to be the first to see it and even get inside to decide if this is the car for you or not? Then come to this unique event and take a closer look to the car, rather then seeing it online. \n\nOnly 150 tickets available, make sure to get one because they are sold very fast. \n\nFor tickets call this number between 8:00 and 17:00 everyday: +40712312345',
                      ),
                      PopularEventsWidget(
                        event: 'Volkswagen Arteon Test Drive',
                        when: 'August 16th, 2023',
                        where: 'Procar Volkswagen',
                        image: 'arteon.jpg',
                        about:
                            'All weekend long, you can stop by from 10 a.m. to 6 p.m. to test drive our brand new Arteon. Test drive is only available for those that got and email invitation from us. If you came by our Service at least once and you made an account, make sure to check your email because you surely are invited. \n\n The event is free, entrance only based on invitation.',
                      ),
                      PopularEventsWidget(
                        event: 'Mercedes AMG GT 63 Show',
                        when: 'September 4th, 2023',
                        where: 'Mercedes Auto Schunn',
                        image: 'AMG_GT_63_fourDoorsModel_upcomingEvent.jpg',
                        about:
                            'You’re invited to attend our annual car of the year show. This year’s event will feature the new Mercedes AMG GT 63. You will have the chance to see the car both from the inside, but also from the outsde. Later that day, an experienced driver will put on a show for our viewers. \n\nMake sure to buy tickets, only a limited amount of people is allowed to participate.\n\nBuy tickets by calling this number: +40723232323',
                      ),
                    ],
                  )),
              SizedBox(
                height: 10,
              ),
              Text(
                "Discover",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 11,
              ),
              Container(
                height: 250,
                width: double.infinity,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    DiscoverWidget(
                        event: 'Show Mustang',
                        when: 'August 11th, 2023',
                        where: 'Mercedes Auto Schunn',
                        image: 'fordMustang.jpg',
                        about:
                            'The namesake of the "pony car" automobile segment, the Mustang was developed as a highly styled line of sporty coupes and convertibles derived from existing model lines, initially distinguished by "long hood, short deck" proportions.   \n\n If this is the car of your dreams, we invite you to this amazing event in which you will have the chance to closely examine and experience the true definition of Ford Mustang.'),
                    DiscoverWidget(
                      event: 'VW Press Conference',
                      when: 'September 8th, 2023',
                      where: 'Procar Volkswagen',
                      image: 'pressConference.jpg',
                      about:
                          'Topics that will be discussed in this press conference:\n\n - dates for new car releases \n - sales goals for the upcoming year \n - change of prices regarding original car components \n - new dealership location \n\n In order to be part of this press conference, an invitation is required. For more information, please contact this number: +40712345678',
                    ),
                    DiscoverWidget(
                      event: 'Night Car Meeting',
                      when: 'September 17th, 2023',
                      where: 'Shopping City Timisoara',
                      image: 'nightCarMeeting.jpg',
                      about:
                          'We invite all car passionates to this amazing event that will take place in Timisoara. Last year in Cluj there were 100 cars and 500 hundred people. Timisoara is a big city and we are sure that many people will come. Do not miss this great oppotunity. \n\n Entrance is only 10 lei, see you there!  ',
                    ),
                    DiscoverWidget(
                      event: 'BMW Seatbelt Test',
                      when: 'October 1st, 2023',
                      where: 'BMW SERVICE TIMISOARA',
                      image: 'seatbeltTest.jpg',
                      about:
                          'Like wearing a helmet on a motorcycle, or using a mask in a panny, wearing a seat belt in any vehicle is the smartest way to keep you safe. As with any car part, seat belts go through testing to ensure they perform at the proper optimal level. At our last event, you’ve seen how crash tests are done, and that’s part of seat belt testing, but there’s more to it than just making sure the crash dummy stays in place. Seat belts are tested in a variety of ways, and BMW invites to see it with your own eyes. \n\n Entrance to event: 10 euros.',
                    ),
                  ],
                ),
              ),
            ]),
      )),
    );
  }
}
