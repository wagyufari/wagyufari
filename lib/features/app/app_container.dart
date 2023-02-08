import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/features/app/screens/gears_screen.dart';
import 'package:wagyufari/features/app/screens/home_screen.dart';
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
        child: MaterialApp.router(
          title: 'wagyufari',
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  color: AppColors.primary,
                  elevation: 2,
                  titleTextStyle: GoogleFonts.lobster(),
                  iconTheme: IconThemeData(color: AppColors.neutral_600))),
          debugShowCheckedModeBanner: false,
          routerConfig: _router,
        ),
      ),
    );
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionDuration: Duration(milliseconds: 100),
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      pageBuilder: (context, state) => buildPageWithDefaultTransition(context: context, state: state, child: HomeScreen()),
    ),
    GoRoute(
        path: "/gears",
      pageBuilder: (context, state) => buildPageWithDefaultTransition(context: context, state: state, child: GearsScreen()),)
  ],
  errorBuilder: (context, state) => Scaffold(
    body: Container(child: Text("${state.error.toString()}")),
  ),
);
