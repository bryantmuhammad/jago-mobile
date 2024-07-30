import 'package:flutter/material.dart';
import 'package:jago/event/model/event.dart';
import 'package:jago/event/widgets/event_list.dart';
import 'package:jago/home/widgets/home_app_bar.dart';
import 'package:jago/home/widgets/home_carousel.dart';
import 'package:jago/home/widgets/language.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final Event event = Event.from({'lower_price': 1000});

    // print(event.lowerPrice);

    return HomeAppBar(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeCarousel(),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              child: Text(
                'Event Jagoan',
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.headlineSmall!.fontSize,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const EventList(),
            const SizedBox(
              height: 10,
            ),
            const EventList(),
          ],
        ),
      ),
    );
  }
}
