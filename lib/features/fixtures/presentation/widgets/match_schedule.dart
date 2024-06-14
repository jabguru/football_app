import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/match_states.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/presentation/pages/single_match_screen.dart';
import 'package:football_app/features/fixtures/presentation/widgets/cached_network_image.dart';
import 'package:intl/intl.dart';

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
          builder: (context) => SingleMatchScreen(fixture: fixture),
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
            HorizontalSpacing(eqW(10.0)),
            Expanded(child: _getMatchStatus()),
            HorizontalSpacing(eqW(10.0)),
            cachedNetworkImage(
              fixture.teams.away.logo,
              color: kScaffoldColor,
              width: 26.0,
            ),
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

  Widget _getMatchStatus() {
    String matchStatus = fixture.status.short;

    if (fixture.status.short == 'HT') {
      return Column(
        children: [
          Text(
            '${fixture.goals?.home ?? 0}  :  ${fixture.goals?.away ?? 0}',
            style: kText12White,
            textAlign: TextAlign.center,
          ),
          Text(
            'HT',
            style: kText10White,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (kMatchInPlay.contains(matchStatus)) {
      return Column(
        children: [
          Text(
            '${fixture.goals?.home ?? 0}  :  ${fixture.goals?.away ?? 0}',
            style: kText14White,
            textAlign: TextAlign.center,
          ),
          Text(
            'LIVE',
            style: kText10MatchTime,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (kMatchFinished.contains(matchStatus)) {
      return Column(
        children: [
          Text(
            '${fixture.goals?.home ?? 0}  :  ${fixture.goals?.away ?? 0}',
            style: kText12White,
            textAlign: TextAlign.center,
          ),
          Text(
            'FT',
            style: kText10White,
            textAlign: TextAlign.center,
          ),
        ],
      );
    } else if (fixture.status.short == 'TBD') {
      return Text(
        'TBD',
        style: kText12White,
        textAlign: TextAlign.center,
      );
    } else if (kMatchCancelled.contains(matchStatus)) {
      return Text(
        'Canc.',
        style: kText12White,
        textAlign: TextAlign.center,
      );
    } else {
      return Text(
        DateFormat.jm().format(fixture.date),
        style: kText12White,
        textAlign: TextAlign.center,
      );
    }
  }
}
