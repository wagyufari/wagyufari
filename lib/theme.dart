import 'package:flutter/material.dart';
import 'package:wagyufari/utils/responsive_widget.dart';

abstract class AppColors {
  static const neutral_0 = Color(0xFFffffff);
  static const neutral_50 = Color(0xFFfafafa);
  static const neutral_100 = Color(0xFFf5f5f5);
  static const neutral_200 = Color(0xFFeeeeee);
  static const neutral_300 = Color(0xFFe0e0e0);
  static const neutral_400 = Color(0xFFbdbdbd);
  static const neutral_500 = Color(0xFF9E9E9E);
  static const neutral_600 = Color(0xFF757575);
  static const neutral_700 = Color(0xFF616161);
  static const neutral_800 = Color(0xFF424242);
  static const neutral_900 = Color(0xFF212121);
  static const background = Color(0xFFB3BABD);
  static const background2 = Color(0xFFABB2B5);
  static const disabledButton = neutral_300;

  static const separator = neutral_100;
  static const border = neutral_300;

  static const textPrimary = neutral_900;
  static const textSecondary = neutral_800;
  static const textTertiary = neutral_600;

  static const cupertinoGray = Color(0xFFF9F9F9);
  static const cupertinoDivider = Color(0xFFDCDCDC);

  static const primary = Color(0xFFA5A28E);
  static const violet600 = Color(0xFF5d0ec2);
  static const skyblue_end = Color(0xFFEAF5FF);
  static const skyblue_start = Color(0xFF698FBC);

  static const linkblue = Color(0xFF072856);
}

abstract class AppTheme {
  static const List<BoxShadow>? boxShadow = [
    BoxShadow(
      color: AppColors.neutral_200,
      spreadRadius: 1,
      blurRadius: 4,
      offset: Offset(0, 1), // changes position of shadow
    )
  ];

  static double textTitle1(BuildContext context) {
    return context.isSmall()
        ? 24
        : context.isMedium()
            ? 24
            : 32;
  }

  static double textBody1(BuildContext context) {
    return context.isSmall()
        ? 16
        : context.isMedium()
            ? 20
            : 20;
  }

  static BoxDecoration boxTheme([double? cornerRadius]) {
    return BoxDecoration(
        color: AppColors.neutral_50,
        border: Border.all(
          color: AppColors.neutral_300,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(cornerRadius ?? 24));
  }
}
