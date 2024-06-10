import 'package:flutter/material.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/constants/text_styles.dart';
import 'package:football_app/features/fixtures/presentation/pages/single_match_screen.dart';
import 'package:football_app/gen/assets.gen.dart';

class LiveMatchWidget extends StatelessWidget {
  const LiveMatchWidget({
    super.key,
    this.notStarted = false,
  });
  final bool notStarted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SingleMatchScreen(),
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
                              fontSize: eqW(21.03),
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
        ),
      ),
    );
  }
}
