import 'package:flutter/material.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/presentation/widgets/match_card.dart';
import 'package:football_app/features/fixtures/presentation/widgets/match_schedule.dart';
import 'package:football_app/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Assets.images.category.image(width: eqW(22.78)),
      //   title: Assets.images.liveScore.image(width: eqW(82.35)),
      //   actions: [
      //     Assets.images.notification.image(width: eqW(22.78)),
      //   ],

      // ),
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: Assets.images.category.image(width: eqW(22.78)),
              title: Assets.images.liveScore.svg(width: eqW(82.35)),
              trailing: Assets.images.notification.image(width: eqW(22.78)),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: eqH(140),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: const [
                        LiveMatchWidget(),
                        LiveMatchWidget(notStarted: true),
                      ],
                    ),
                  ),
                  VerticalSpacing(eqH(21)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: screenPadding(),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Match Schedule',
                              style: kText14White,
                            ),
                            Text(
                              'See All',
                              style: kText12Secondary,
                            ),
                          ],
                        ),
                        VerticalSpacing(eqH(14)),
                        const MatchSchedule(),
                        const MatchSchedule(),
                        const MatchSchedule(),
                        const MatchSchedule(),
                        const MatchSchedule(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.leading,
    required this.title,
    required this.trailing,
  });
  final Widget leading;
  final Widget title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenPadding(),
        vertical: eqW(12.27),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading,
          title,
          trailing,
        ],
      ),
    );
  }
}
