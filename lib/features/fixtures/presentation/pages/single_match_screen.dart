import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/presentation/pages/home.dart';
import 'package:football_app/gen/assets.gen.dart';

class SingleMatchScreen extends StatelessWidget {
  const SingleMatchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Assets.images.matchInfoBg.image(fit: BoxFit.cover),
          SafeArea(
            child: Column(
              children: [
                CustomAppBar(
                  leading: GestureDetector(
                      // TODO: FIX after implementing navigation
                      onTap: () => Navigator.pop(context),
                      child: Assets.images.iconBack.svg(width: eqW(21))),
                  title: Text(
                    'Final Score',
                    style: kAppBarTitleText,
                  ),
                  trailing: Assets.images.iconInformation.svg(width: eqW(21)),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: screenPadding()),
                    child: Column(
                      children: [
                        const VerticalSpacing(20),
                        Center(
                          child: Text(
                            'Full Time',
                            style: kText10MatchTime,
                          ),
                        ),
                        const VerticalSpacing(20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: eqW(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.images.arsenalFC.image(width: 65.0),
                              const HorizontalSpacing(23.5),
                              Text(
                                '2    -   2',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: eqW(23),
                                ),
                              ),
                              const HorizontalSpacing(23.5),
                              Assets.images.brightonFC.image(width: 65.0),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'De Jong 66’',
                                  style: kText10White,
                                ),
                                VerticalSpacing(eqH(6)),
                                Text(
                                  'Depay 79’',
                                  style: kText10White,
                                ),
                              ],
                            ),
                            const HorizontalSpacing(23.5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  'Alvarez 21’',
                                  style: kText10White,
                                ),
                                VerticalSpacing(eqH(6)),
                                Text(
                                  'Palmer 70’',
                                  style: kText10White,
                                ),
                              ],
                            ),
                          ],
                        ),
                        VerticalSpacing(eqH(16)),
                        Column(
                          children: [
                            Text(
                              'Match Statistic',
                              style: kText14White,
                            ),
                            VerticalSpacing(eqH(14)),
                            const StatisticWidget(
                              home: '11',
                              title: 'Shot',
                              away: '16',
                            ),
                            const StatisticWidget(
                              home: '7',
                              title: 'Shot on Target',
                              away: '8',
                            ),
                            const StatisticWidget(
                              home: '48%',
                              title: 'Ball Possession',
                              away: '52%',
                            ),
                            const StatisticWidget(
                              home: '500',
                              title: 'Pass',
                              away: '532',
                            ),
                            const StatisticWidget(
                              home: '89%',
                              title: 'Pass Accuracy',
                              away: '90%',
                            ),
                            const StatisticWidget(
                              home: '7',
                              title: 'Foul',
                              away: '13',
                            ),
                            const StatisticWidget(
                              home: '0',
                              title: 'Yellow Card',
                              away: '1',
                            ),
                            const StatisticWidget(
                              home: '0',
                              title: 'Red Card',
                              away: '0',
                            ),
                            const StatisticWidget(
                              home: '1',
                              title: 'Offside',
                              away: '5',
                            ),
                            const StatisticWidget(
                              home: '3',
                              title: 'Corner Kick',
                              away: '2',
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class StatisticWidget extends StatelessWidget {
  const StatisticWidget({
    super.key,
    required this.home,
    required this.title,
    required this.away,
  });
  final String home;
  final String title;
  final String away;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: eqW(14.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            home,
            style: kText14White,
          ),
          Text(
            title,
            style: kText12GreyR,
          ),
          Text(
            away,
            style: kText14White,
          ),
        ],
      ),
    );
  }
}
