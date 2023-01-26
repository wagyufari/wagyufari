import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/core/widgets/bloc/global_bloc.dart';
import 'package:wagyufari/features/app/app_container.dart';
import 'package:wagyufari/features/app/screens/gears_screen.dart';
import 'package:wagyufari/features/app/screens/home_screen.dart';
import 'package:wagyufari/theme.dart';
import 'package:wagyufari/utils/chucker/src/view/helper/chucker_ui_helper.dart';
import 'package:wagyufari/utils/shake_detector.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ShakeDetector.autoStart(
        onPhoneShake: () {
          ChuckerUiHelper.showChuckerScreen();
        },
        shakeThresholdGravity: 1.5);
    return BlocProvider(
      create: (context) => GlobalBloc(),
      child: AppContainer(),
    );
  }
}

abstract class Routes {
  static const HOME = '/';
  static const GEARS = '/gears';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.GEARS,
      page: () => GearsScreen(),
    )
  ];
}
