import 'package:flutter/material.dart';

enum BottomNavScreens {
  home,
  standings,
  bookmark,
  profile,
}

class BaseScreenService {
  static PageController basePageController = PageController();
  static Duration basePageControllerDuration =
      const Duration(milliseconds: 300);
  static Cubic basePageControllerCurves = Curves.easeInOut;

  static goTo(BottomNavScreens screen) {
    try {
      if (basePageController.hasClients) {
        basePageController.animateToPage(
          getPageIndex(screen),
          duration: basePageControllerDuration,
          curve: basePageControllerCurves,
        );
      }
    } catch (e) {
      print(e);
      if (basePageController.hasClients) {
        basePageController.jumpToPage(getPageIndex(screen));
      }
    }
  }

  static int getPageIndex(BottomNavScreens screen) {
    switch (screen) {
      case BottomNavScreens.home:
        return 0;

      case BottomNavScreens.standings:
        return 1;

      case BottomNavScreens.bookmark:
        return 2;

      case BottomNavScreens.profile:
        return 3;

      default:
        return 0;
    }
  }
}
