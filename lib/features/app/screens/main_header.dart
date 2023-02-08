import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/theme.dart';

import 'package:wagyufari/utils/responsive_widget.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(
      {Key? key, required this.selectedIndex, required this.onTapMenu})
      : super(key: key);

  final int selectedIndex;
  final Function onTapMenu;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1000),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: context.isSmall() ? 24 : 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(16)),
                ),
                horizontalSpacer(width: 8),
                Text(
                  "Ghifari",
                  style: GoogleFonts.inter(
                      fontSize: 24, fontWeight: FontWeight.w600),
                )
              ],
            ),
            GestureDetector(
                onTap: () {
                  onTapMenu();
                },
                child: Icon(
                  Icons.menu,
                  size: 28,
                )),
          ],
        ),
      ),
    );
  }
}
