import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:jago/event/model/event.dart';
import 'package:jago/event/widgets/event_card.dart';

class EventList extends StatefulWidget {
  const EventList({super.key, this.width = 300, this.height = 180});

  final double width;
  final double height;

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  late PageController _pageController;
  List<Event> eventLists = [];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9);
    _fetchEvent();
  }

  void _fetchEvent() async {
    try {
      final url = Uri.https('api.jagotiket.com', 'api/events/all');
      final dio = Dio();

      final request = await dio.get(url.toString());

      final Map<String, dynamic> data = request.data['data'];

      List<Event> tempList = [];
      for (final e in data['data'] as List) {
        tempList.add(Event.from(e));
      }

      setState(() {
        eventLists = tempList;
      });

      print(eventLists[0].lowerPrice);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<int> events = [1, 2, 3, 4, 5];

    // List<Event> dummyEvent = [
    //   Event(
    //       id: 1,
    //       name: 'Event Pertama',
    //       location: 'Semarang',
    //       link: 'event.com',
    //       province: 'Semarang',
    //       image:
    //           "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
    //       dateStart: DateTime.now(),
    //       lowerPrice: 100000),
    //   Event(
    //       id: 2,
    //       name: 'Event Kedua',
    //       location: 'Semarang',
    //       link: 'event.com',
    //       province: 'Semarang',
    //       image: 'https://wallpaperaccess.com/full/2637581.jpg',
    //       dateStart: DateTime.now(),
    //       lowerPrice: 200000),
    //   Event(
    //       id: 3,
    //       name: 'Event Ketiga',
    //       location: 'Semarang',
    //       link: 'event.com',
    //       province: 'Semarang',
    //       image:
    //           'https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg',
    //       dateStart: DateTime.now(),
    //       lowerPrice: 150000),
    // ];

    return PageView.builder(
      controller: _pageController,
      itemCount: eventLists.length,
      itemBuilder: (context, index) {
        return EventCard(
          event: eventLists[index],
        );
      },
    );
  }
}
