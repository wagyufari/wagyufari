import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/theme.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: GetMaterialApp.router(
          title: 'wagyufari',
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: AppColors.primary,
                  elevation: 2,
                  titleTextStyle: GoogleFonts.lobster(),
                  iconTheme: IconThemeData(color: AppColors.neutral_600))),
          debugShowCheckedModeBanner: false,
          getPages: AppPages.pages,
          defaultTransition: Transition.fadeIn,
        ),
      ),
    );
  }
}
