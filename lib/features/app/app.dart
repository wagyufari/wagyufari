import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/prefs/prefs.dart';
import 'package:wagyufari/core/widgets/bloc/global_bloc.dart';
import 'package:wagyufari/core/widgets/spacer.dart';
import 'package:wagyufari/features/app/bloc/app_bloc.dart';
import 'package:wagyufari/features/app/screens/main/main_screen.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/chucker/src/view/helper/chucker_ui_helper.dart';
import 'package:wagyufari/utils/responsive_widget.dart';
import 'package:wagyufari/utils/shake_detector.dart';
import 'dart:io';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(
        onPhoneShake: () {
          ChuckerUiHelper.showChuckerScreen();
        },
        shakeThresholdGravity: 1.5);

    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GlobalBloc()),
          BlocProvider(create: (context) => AppBloc())
        ],
        child: Container(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: MaterialApp(
              title: 'wagyufari',
              theme: ThemeData(
                  appBarTheme: AppBarTheme(
                      color: AppColors.primary,
                      elevation: 2,
                      titleTextStyle: GoogleFonts.lobster(),
                      iconTheme: IconThemeData(color: AppColors.neutral_600))),
              home: MainScreen(),
            ),
          ),
        ));
  }
}



