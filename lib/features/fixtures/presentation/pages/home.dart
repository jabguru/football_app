import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:football_app/features/fixtures/presentation/widgets/error_alert_widget.dart';
import 'package:football_app/features/fixtures/presentation/widgets/match_card.dart';
import 'package:football_app/features/fixtures/presentation/widgets/match_schedule.dart';
import 'package:football_app/features/fixtures/presentation/widgets/progress_indicator.dart';
import 'package:football_app/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FixturesBloc>().add(GetFixtures());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(
              leading: Assets.images.category.image(width: eqW(22.78)),
              title: Assets.images.liveScore.svg(width: eqW(82.35)),
              trailing: Assets.images.notification.image(width: eqW(22.78)),
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<FixturesBloc>().add(GetFixtures());
                },
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
                          BlocBuilder<FixturesBloc, FixturesState>(
                            builder: (context, state) {
                              if (state is GetFixturesLoading) {
                                return const CustomProgressIndicator();
                              } else if (state is GetFixturesLoaded) {
                                return Column(
                                  children: state.fixtures
                                      .map((e) => MatchSchedule(fixture: e))
                                      .toList(),
                                );
                              } else if (state is GetFixturesError) {
                                return ErrorAlertWidget(
                                  title: 'Error loading fixtures...',
                                  message: state.message,
                                );
                              }
                              return const SizedBox.shrink();
                            },
                          ),
                        ],
                      ),
                    )
                  ],
                ),
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
