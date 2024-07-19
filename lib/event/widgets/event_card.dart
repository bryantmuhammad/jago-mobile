import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:jago/event/model/event.dart';
import 'package:jago/util/currency_format.dart';

class EventCard extends StatelessWidget {
  const EventCard({
    super.key,
    this.height = 180,
    required this.event,
  });

  final double height;
  final Event event;

  @override
  Widget build(BuildContext context) {
    var date = DateFormat(
      'd MMMM y',
      context.locale.toString(),
    ).format(event.dateStart);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          height: height,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              event.image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    '${event.province}, ${event.location}',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'IDR ${CurrencyFormat.convertToIdr(event.lowerPrice, 2)}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromARGB(255, 242, 100, 25),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
