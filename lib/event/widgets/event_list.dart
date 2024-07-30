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
    _pageController = PageController(viewportFraction: 0.88);
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
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        double viewportFraction =
            (MediaQuery.of(context).orientation == Orientation.portrait)
                ? 0.88
                : 0.4;

        _pageController = PageController(viewportFraction: viewportFraction);

        return SizedBox(
          height: 350,
          child: PageView.builder(
            padEnds: false,
            controller: _pageController,
            itemCount: eventLists.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: EventCard(
                  event: eventLists[index],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
