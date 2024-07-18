import 'package:flutter/material.dart';
import 'package:jago/widgets/custom_app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomAppBar(
      child: Text('Homepages'),
    );
  }
}