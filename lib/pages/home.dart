import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/gen/assets.gen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    final double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      // appBar: AppBar(
      //   leading: Assets.images.category.image(width: eqW(22.78, screenWidth)),
      //   title: Assets.images.liveScore.image(width: eqW(82.35, screenWidth)),
      //   actions: [
      //     Assets.images.notification.image(width: eqW(22.78, screenWidth)),
      //   ],

      // ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: eqW(14.02, screenWidth),
                vertical: eqW(12.27, screenWidth),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Assets.images.category.image(width: eqW(22.78, screenWidth)),
                  Assets.images.liveScore.image(width: eqW(82.35, screenWidth)),
                  Assets.images.notification
                      .image(width: eqW(22.78, screenWidth)),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(15.05),
              child: SizedBox(
                width: eqW(224, screenWidth),
                height: eqH(120, screenHeight),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Assets.images.cardLive.svg(fit: BoxFit.cover),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: eqW(15.14, screenWidth),
                        vertical: 17.52,
                      ),
                      child: Column(
                        children: [
                          Text(
                            '60 : 22',
                            style: kSmallText,
                          ),
                          const VerticalSpacing(7.32),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Assets.images.arsenalFC.image(width: 45.0),
                              const HorizontalSpacing(23.5),
                              Text(
                                '2 - 2',
                                style: TextStyle(
                                  color: kWhiteColor,
                                  fontWeight: FontWeight.w600,
                                  fontSize: eqW(21.03, screenWidth),
                                ),
                              ),
                              const HorizontalSpacing(23.5),
                              Assets.images.brightonFC.image(width: 45.0),
                            ],
                          ),
                          const VerticalSpacing(15.14),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'De Jong 66’',
                                    style: kSmallText,
                                  ),
                                  Text(
                                    'Depay 79’',
                                    style: kSmallText,
                                  ),
                                ],
                              ),
                              const HorizontalSpacing(23.5),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Alvarez 21’',
                                    style: kSmallText,
                                  ),
                                  Text(
                                    'Palmer 70’',
                                    style: kSmallText,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
