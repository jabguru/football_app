import 'package:flutter/material.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      appBar: AppBar(
        title: Assets.images.liveScore.image(width: eqW(82.35, screenWidth)),
      ),
    );
  }
}
