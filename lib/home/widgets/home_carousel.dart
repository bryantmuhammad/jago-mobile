import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeCarousel extends StatefulWidget {
  const HomeCarousel({super.key});

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  List<String> images = [
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg",
    "https://wallpaperaccess.com/full/2637581.jpg",
    "https://uhdwallpapers.org/uploads/converted/20/01/14/the-mandalorian-5k-1920x1080_477555-mm-90.jpg"
  ];

  late PageController _pageController;
  late Timer _timer;
  int _activePage = 1;
  // int _pageIndex =

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);

    // _timer = Timer.periodic(const Duration(seconds: 7), _animatePage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            pageSnapping: true,
            controller: _pageController,
            onPageChanged: (page) {
              // _timer.cancel();
              setState(() {
                _activePage = page % images.length;
              });
            },
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(images[index % images.length]),
                ),
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: indicators(images.length, _activePage),
        )
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(
      imagesLength,
      (index) {
        bool isSelected = currentIndex == index;
        return Container(
          margin: const EdgeInsets.all(2),
          width: 13,
          height: 10,
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.primary.withAlpha(26),
            shape: isSelected ? BoxShape.rectangle : BoxShape.circle,
            borderRadius: isSelected
                ? const BorderRadius.all(
                    Radius.elliptical(50, 100),
                  )
                : null,
          ),
        );
      },
    );
  }

  void _animatePage(timer) {
    _pageController.animateToPage(
      timer.tick,
      duration: const Duration(seconds: 2),
      curve: Curves.easeIn,
    );
  }
}
