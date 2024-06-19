import 'package:flutter/material.dart';
import 'package:football_app/constants/global_variables.dart';

double get kScreenWidth =>
    MediaQuery.sizeOf(GlobalVariables.navigatorKey.currentContext!).width;
double get kScreenHeight =>
    MediaQuery.sizeOf(GlobalVariables.navigatorKey.currentContext!).height;

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
// double eqH(double inDesign, double screenHeight) =>
//     (inDesign / 672.83) * screenHeight;
double eqH(double inDesign) => (inDesign / 672.83) * kScreenHeight;

//Calculate equivalent of size in design to size in screen Width
// double eqW(double inDesign, double screenWidth) =>
//     (inDesign / 328.53) * screenWidth;
double eqW(double inDesign) => (inDesign / 328.53) * kScreenWidth;

EdgeInsetsGeometry pad({
  double horiz = 0,
  double vert = 0,
  double? both,
  required screenWidth,
  required screenHeight,
}) =>
    EdgeInsets.symmetric(
      horizontal: eqW(both ?? horiz),
      vertical: eqH(both ?? vert),
    );

width(BuildContext context) => MediaQuery.of(context).size.width;

double get screenPadding => eqW(14.02);
