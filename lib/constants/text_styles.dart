import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/global_variables.dart';
import 'package:football_app/constants/size.dart';

TextStyle kSmallText = TextStyle(
  color: kWhiteColor,
  fontWeight: FontWeight.w500,
  fontSize: eqW(8.76,
      MediaQuery.sizeOf(GlobalVariables.navigatorKey.currentContext!).width),
);
