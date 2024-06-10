import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/gen/assets.gen.dart';

class MatchSchedule extends StatelessWidget {
  const MatchSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(6.2),
      ),
      margin: EdgeInsets.only(bottom: eqH(10)),
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 12.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Chelsea',
            style: kText12White,
          ),
          const HorizontalSpacing(10.0),
          Assets.images.arsenalFC.image(width: 26.0),
          const HorizontalSpacing(10.0),
          Column(
            children: [
              Text(
                '27 Aug 2022',
                style: kText10White,
              ),
              Text(
                '01.40',
                style: kText10White,
              ),
            ],
          ),
          const HorizontalSpacing(10.0),
          Assets.images.brightonFC.image(width: 26.0),
          const HorizontalSpacing(10.0),
          Text(
            'Leicester',
            style: kText12White,
          ),
        ],
      ),
    );
  }
}
