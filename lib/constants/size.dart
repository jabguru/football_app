import 'package:flutter/material.dart';

class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing(
    this.value, {
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: value,
    );
  }
}

class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing(
    this.value, {
    super.key,
  });

  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: value,
    );
  }
}

//Calculate equivalent of size in design to size in screen height
double eqH(double inDesign, double screenHeight) =>
    (inDesign / 711.38) * screenHeight;

//Calculate equivalent of size in design to size in screen Width
double eqW(double inDesign, double screenWidth) =>
    (inDesign / 328.53) * screenWidth;

EdgeInsetsGeometry pad({
  double horiz = 0,
  double vert = 0,
  double? both,
  required screenWidth,
  required screenHeight,
}) =>
    EdgeInsets.symmetric(
      horizontal: eqW(both ?? horiz, screenWidth),
      vertical: eqH(both ?? vert, screenHeight),
    );

width(BuildContext context) => MediaQuery.of(context).size.width;
