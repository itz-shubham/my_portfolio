import 'package:flutter/rendering.dart';

enum ScreenType { mobile, tablet, desktop }

getScreenType(BoxConstraints constraints) {
  if (constraints.maxWidth <= 500) {
    return ScreenType.mobile;
  } else if (constraints.maxWidth <= 750) {
    return ScreenType.tablet;
  } else {
    return ScreenType.desktop;
  }
}
