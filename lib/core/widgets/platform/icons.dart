import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:wagyufari/theme.dart';

class PlatformIcons {
  static IconData back =
      Platform.isAndroid ? Icons.arrow_back : Icons.arrow_back_ios_new;
}

class PlatformScaledAppbarIcon extends StatelessWidget {
  const PlatformScaledAppbarIcon({Key? key, required this.iconData})
      : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: Platform.isAndroid ? 1 : 0.8,
      child: Icon(
        iconData,
        color: AppColors.neutral_400,
      ),
    );
  }
}
