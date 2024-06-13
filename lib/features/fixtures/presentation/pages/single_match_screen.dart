import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/core/utils/extensions/str_extension.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:football_app/features/fixtures/presentation/pages/home.dart';
import 'package:football_app/features/fixtures/presentation/widgets/cached_network_image.dart';
import 'package:football_app/features/fixtures/presentation/widgets/error_alert_widget.dart';
import 'package:football_app/features/fixtures/presentation/widgets/progress_indicator.dart';
import 'package:football_app/gen/assets.gen.dart';
import 'package:intl/intl.dart';

class SingleMatchScreen extends StatefulWidget {
  final Fixture fixture;
  const SingleMatchScreen({
    super.key,
    required this.fixture,
  });

  @override
  State<SingleMatchScreen> createState() => _SingleMatchScreenState();
}

class _SingleMatchScreenState extends State<SingleMatchScreen> {
  String _time = '';
  String _score = '';
  @override
  void initState() {
    super.initState();
    _getMatchStatus();
    context.read<FixturesBloc>().add(
          GetStatistics(
            fixtureId: widget.fixture.id,
          ),
        );
  }

  void _getMatchStatus() {
    _score =
        '${widget.fixture.goals?.home ?? 0}    -   ${widget.fixture.goals?.away ?? 0}';
    switch (widget.fixture.status.short) {
      case 'LIVE':
        _time = 'LIVE';
      case 'FT':
        _time = 'Full Time';
      case 'HT':
        _time = 'Half Time';

      case 'TBD':
        _time = 'TBD';
        _score = '-';
        break;

      case 'CANC' || 'PST' || 'ABD' || 'AWD' || 'WO' || 'SUSP':
        _time = 'Cancelled';
        _score = '-';
        break;
      default:
        _score = DateFormat.jm().format(widget.fixture.date);
    }
  }

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
                            _time,
                            style: kText10MatchTime,
                          ),
                        ),
                        const VerticalSpacing(20),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: eqW(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              cachedNetworkImage(
                                widget.fixture.teams.home.logo,
                                color: kScaffoldColor,
                                width: 65.0,
                              ),
                              const HorizontalSpacing(23.5),
                              Text(
                                _score,
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: eqW(23),
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const HorizontalSpacing(23.5),
                              cachedNetworkImage(
                                widget.fixture.teams.away.logo,
                                color: kScaffoldColor,
                                width: 65.0,
                              ),
                            ],
                          ),
                        ),
                        const VerticalSpacing(20),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.start,
                        //       children: [
                        //         Text(
                        //           'De Jong 66’',
                        //           style: kText10White,
                        //         ),
                        //         VerticalSpacing(eqH(6)),
                        //         Text(
                        //           'Depay 79’',
                        //           style: kText10White,
                        //         ),
                        //       ],
                        //     ),
                        //     const HorizontalSpacing(23.5),
                        //     Column(
                        //       crossAxisAlignment: CrossAxisAlignment.end,
                        //       children: [
                        //         Text(
                        //           'Alvarez 21’',
                        //           style: kText10White,
                        //         ),
                        //         VerticalSpacing(eqH(6)),
                        //         Text(
                        //           'Palmer 70’',
                        //           style: kText10White,
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        VerticalSpacing(eqH(16)),
                        Column(
                          children: [
                            Text(
                              'Match Statistic',
                              style: kText14White,
                            ),
                            VerticalSpacing(eqH(14)),
                            BlocBuilder<FixturesBloc, FixturesState>(
                              builder: (context, state) {
                                if (state is GetStatisticsLoading) {
                                  return const CustomProgressIndicator();
                                } else if (state is GetStatisticsLoaded) {
                                  if (state.statistics != null) {
                                    bool teamOneIsHome = false;
                                    if (state.statistics!.team1.team.id ==
                                        widget.fixture.teams.home.id) {
                                      teamOneIsHome = true;
                                    }
                                    return Column(
                                      children: teamOneIsHome
                                          ? state.statistics!.team1.statistics
                                              .where((element) =>
                                                  element.value.isNotEmpty)
                                              .map(
                                                (e) => StatisticWidget(
                                                  home: e.value.toString(),
                                                  title: e.type,
                                                  away: state.statistics!.team2
                                                      .statistics
                                                      .where((st) =>
                                                          st.type == e.type)
                                                      .first
                                                      .value
                                                      .toString(),
                                                ),
                                              )
                                              .toList()
                                          : state.statistics!.team2.statistics
                                              .where((element) =>
                                                  element.value.isNotEmpty)
                                              .map(
                                                (e) => StatisticWidget(
                                                  home: e.value.toString(),
                                                  title: e.type,
                                                  away: state.statistics!.team1
                                                      .statistics
                                                      .where((st) =>
                                                          st.type == e.type)
                                                      .first
                                                      .value
                                                      .toString(),
                                                ),
                                              )
                                              .toList(),
                                    );
                                  }

                                  return Text(
                                    'Statistics Unavailable',
                                    style: kText12White,
                                  );
                                } else if (state is GetStatisticsError) {
                                  return ErrorAlertWidget(
                                    title: 'Error loading statistics...',
                                    message: state.message,
                                  );
                                }
                                return const SizedBox.shrink();
                              },
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
            title.snakeToCamelTitleCase,
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
