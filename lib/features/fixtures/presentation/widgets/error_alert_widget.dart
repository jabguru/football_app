import 'package:flutter/material.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';

class ErrorAlertWidget extends StatelessWidget {
  final String title;
  final String message;
  const ErrorAlertWidget({
    super.key,
    required this.title,
    required this.message,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 60.0),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: kText14White,
          ),
          const VerticalSpacing(20.0),
          Text(
            message,
            textAlign: TextAlign.center,
            style: kText12GreyR,
          ),
        ],
      ),
    );
  }
}
