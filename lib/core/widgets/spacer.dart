import 'package:flutter/material.dart';

class verticalSpacer extends StatelessWidget {
  const verticalSpacer({Key? key, required this.height}) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height,);
  }
}

class horizontalSpacer extends StatelessWidget {
  const horizontalSpacer({Key? key, required this.width}) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}

