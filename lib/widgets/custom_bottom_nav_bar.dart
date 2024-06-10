import 'package:flutter/cupertino.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/size.dart';
import 'package:football_app/gen/assets.gen.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
    required this.pageIndex,
    required this.onTap,
  });

  final int pageIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    bool needsPadding = MediaQuery.of(context).viewPadding.bottom > 0;

    double iconHeight = eqW(21.03);

    return DecoratedBox(
      decoration: const BoxDecoration(
        color: kSecondaryColor,
      ),
      child: Padding(
        padding: EdgeInsets.only(top: needsPadding ? 16.0 : 0),
        child: CupertinoTabBar(
          backgroundColor: kSecondaryColor,
          currentIndex: pageIndex,
          onTap: onTap,
          activeColor: kGrey1,
          inactiveColor: kGrey2,
          border: null,
          items: [
            BottomNavigationBarItem(
              // pageIndex == baseScreenService.getPageIndex(BottomNavScreens.home)
              //     ? 'assets/images/bottom-nav-items/home-solid.png'
              //     : 'assets/images/bottom-nav-items/home-outline.png',
              icon: Assets.images.home.image(height: iconHeight),
            ),
            BottomNavigationBarItem(
              icon: Assets.images.document.image(height: iconHeight),
            ),
            BottomNavigationBarItem(
              icon: Assets.images.bookmark.image(height: iconHeight),
            ),
            BottomNavigationBarItem(
              icon: Assets.images.profile.image(height: iconHeight),
            ),
          ],
        ),
      ),
    );
  }
}
