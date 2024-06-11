import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: kPrimaryLight,
    );
  }
}
