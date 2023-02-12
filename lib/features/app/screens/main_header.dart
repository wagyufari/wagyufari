import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/theme.dart';

import 'package:wagyufari/utils/responsive_widget.dart';

class MainHeader extends StatelessWidget {
  const MainHeader(
      {Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1400),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: (){
                      context.go(Routes.HOME);
                    },
                    child: Text(
                      "Wagyufari",
                      style: GoogleFonts.montserrat(
                          fontSize: 32,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -4),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    launchUrlString(
                        "https://api.whatsapp.com/send?phone=+6287778792230");
                  },
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.neutral_300, width: 1),
                            borderRadius: BorderRadius.circular(8)),
                        child: Padding(
                          padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            "Reach Me",
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                        )),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
