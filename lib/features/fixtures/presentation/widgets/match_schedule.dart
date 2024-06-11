import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/presentation/pages/single_match_screen.dart';
import 'package:football_app/features/fixtures/presentation/widgets/cached_network_image.dart';

class MatchSchedule extends StatelessWidget {
  final Fixture fixture;
  const MatchSchedule({
    super.key,
    required this.fixture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SingleMatchScreen(),
        ),
      ),
      child: Container(
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
            Expanded(
              child: Text(
                fixture.teams.home.name,
                style: kText12White,
                textAlign: TextAlign.right,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
            HorizontalSpacing(eqW(10.0)),
            cachedNetworkImage(
              fixture.teams.home.logo,
              color: kScaffoldColor,
              width: 26.0,
            ),
            // Assets.images.arsenalFC.image(width: 26.0),
            HorizontalSpacing(eqW(10.0)),
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
            HorizontalSpacing(eqW(10.0)),
            cachedNetworkImage(
              fixture.teams.away.logo,
              color: kScaffoldColor,
              width: 26.0,
            ),
            // Assets.images.brightonFC.image(width: 26.0),
            HorizontalSpacing(eqW(10.0)),
            Expanded(
              child: Text(
                fixture.teams.away.name,
                style: kText12White,
                overflow: TextOverflow.clip,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
