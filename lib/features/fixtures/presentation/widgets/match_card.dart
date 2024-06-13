import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/presentation/pages/single_match_screen.dart';
import 'package:football_app/features/fixtures/presentation/widgets/cached_network_image.dart';
import 'package:football_app/gen/assets.gen.dart';

class LiveMatchWidget extends StatelessWidget {
  final Fixture fixture;
  const LiveMatchWidget({
    super.key,
    required this.fixture,
    this.notStarted = false,
  });
  final bool notStarted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SingleMatchScreen(fixture: fixture),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: screenPadding(),
          right: notStarted ? screenPadding() : 0.0,
          top: notStarted ? 10.0 : 0.0,
          bottom: notStarted ? 10.0 : 0.0,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.05),
          child: Container(
            width: eqW(notStarted ? 208 : 224),
            // height: eqH(notShowing ? 120 : 140, screenHeight),
            color: kSecondaryColor,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (!notStarted) Assets.images.cardLive.svg(fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: eqW(15.14),
                    vertical: 17.52,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LIVE',
                        style: kSmallText,
                      ),
                      const VerticalSpacing(7.32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cachedNetworkImage(
                            fixture.teams.home.logo,
                            color: kScaffoldColor,
                            width: 45.0,
                          ),
                          const HorizontalSpacing(23.5),
                          Text(
                            '${fixture.goals?.home ?? 0} - ${fixture.goals?.away ?? 0}',
                            style: TextStyle(
                              color: kWhiteColor,
                              fontWeight: FontWeight.w600,
                              fontSize: eqW(21.03),
                            ),
                          ),
                          const HorizontalSpacing(23.5),
                          cachedNetworkImage(
                            fixture.teams.away.logo,
                            color: kScaffoldColor,
                            width: 45.0,
                          ),
                        ],
                      ),
                      // const VerticalSpacing(15.14),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.start,
                      //       children: [
                      //         Text(
                      //           'De Jong 66’',
                      //           style: kSmallText,
                      //         ),
                      //         Text(
                      //           'Depay 79’',
                      //           style: kSmallText,
                      //         ),
                      //       ],
                      //     ),
                      //     const HorizontalSpacing(23.5),
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.end,
                      //       children: [
                      //         Text(
                      //           'Alvarez 21’',
                      //           style: kSmallText,
                      //         ),
                      //         Text(
                      //           'Palmer 70’',
                      //           style: kSmallText,
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
