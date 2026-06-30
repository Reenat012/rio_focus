import 'package:flutter/material.dart';

abstract final class AppSpacing {
  static const double xSmall = 8;
  static const double small = 12;
  static const double medium = 16;
  static const double large = 20;
  static const double xLarge = 24;
  static const double xxLarge = 28;
  static const double xxxLarge = 32;
}

abstract final class AppRadii {
  static const double control = 26;
  static const double panel = 30;
  static const double character = 52;
  static const double pill = 999;
}

abstract final class AppSizes {
  static const double primaryActionHeight = 64;
  static const double catViewWidth = 204;
  static const double catCardSize = 176;
}

abstract final class AppElevation {
  static const double softBlur = 24;
  static const Offset softOffset = Offset(0, 12);

  static const double raisedBlur = 28;
  static const Offset raisedOffset = Offset(0, 16);

  static const double glowBlur = 42;
  static const Offset glowOffset = Offset(0, 8);
}
