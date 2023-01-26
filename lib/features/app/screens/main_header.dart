import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/theme.dart';
import 'package:get/get.dart';
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
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: AppColors.neutral_100,
            spreadRadius: 4,
            blurRadius: 4,
            offset: Offset(0, 5))
      ]),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 20, horizontal: context.isSmall() ? 24 : 64),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 16,
                  width: 16,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(8)),
                ),
                horizontalSpacer(width: 8),
                Text(
                  "Ghifari",
                  style: GoogleFonts.inter(
                      fontSize: 16, fontWeight: FontWeight.w600),
                )
              ],
            ),
            context.isSmall()
                ? GestureDetector(
                    onTap: () {
                      onTapMenu();
                    },
                    child: Icon(
                      Icons.menu,
                      size: 28,
                    ))
                : Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.rootDelegate.toNamed(Routes.HOME);
                        },
                        child: Text(
                          "Home",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: AppColors.textPrimary),
                        ),
                      ),
                      horizontalSpacer(width: 32),
                      GestureDetector(
                        onTap: () {
                          Get.rootDelegate.toNamed(Routes.GEARS);
                        },
                        child: Text(
                          "Gears",
                          style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: selectedIndex == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: AppColors.textPrimary),
                        ),
                      )
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
