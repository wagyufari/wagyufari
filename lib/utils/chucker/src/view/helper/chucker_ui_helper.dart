import 'package:wagyufari/utils/chucker/src/helpers/extensions.dart';
import 'package:wagyufari/utils/chucker/src/helpers/shared_preferences_manager.dart';
import 'package:wagyufari/utils/chucker/src/localization/localization.dart';

import 'package:wagyufari/utils/chucker/src/models/settings.dart';
import 'package:wagyufari/utils/chucker/src/view/chucker_page.dart';
import 'package:wagyufari/utils/chucker/src/view/helper/chucker_button.dart';
import 'package:wagyufari/utils/chucker/src/view/helper/colors.dart';
import 'package:wagyufari/utils/chucker/src/view/widgets/notification.dart'
    as notification;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

///[ChuckerUiHelper] handles the UI part of `chucker_flutter`
///
///You must initialize ChuckerObserver in the `MaterialApp`
///of your application as it is required to show notification and the screens
///of `chucker_flutter`
class ChuckerUiHelper {
  static final List<OverlayEntry?> _overlayEntries = List.empty(growable: true);

  ///Only for testing
  static bool notificationShown = false;

  ///[settings] to modify ui behaviour of chucker screens and notification
  static Settings settings = Settings.defaultObject();

  ///[showNotification] shows the rest api [method] (GET, POST, PUT, etc),
  ///[statusCode] (200, 400, etc) response status and [path]
  static bool showNotification({
    required String method,
    required int statusCode,
    required String path,
    required DateTime requestTime,
  }) {
    if (ChuckerUiHelper.settings.showNotification &&
        ChuckerFlutter.navigatorObserver.navigator != null) {
      final overlay = ChuckerFlutter.navigatorObserver.navigator!.overlay;
      final _entry = _createOverlayEntry(method, statusCode, path, requestTime);
      _overlayEntries.add(_entry);
      overlay?.insert(_entry);
      notificationShown = true;
      return true;
    }
    notificationShown = false;
    return false;
  }

  static OverlayEntry _createOverlayEntry(
    String method,
    int statusCode,
    String path,
    DateTime requestTime,
  ) {
    return OverlayEntry(
      builder: (context) {
        return Align(
          alignment: settings.notificationAlignment,
          child: notification.Notification(
            statusCode: statusCode,
            method: method,
            path: path,
            removeNotification: _removeNotification,
            requestTime: requestTime,
          ),
        );
      },
    );
  }

  static void _removeNotification() {
    for (final entry in _overlayEntries) {
      if (entry != null) {
        entry.remove();
      }
    }
    _overlayEntries.clear();
  }

  ///[showChuckerScreen] shows the screen containing the list of recored
  ///api requests
  static void showChuckerScreen() {
    SharedPreferencesManager.getInstance().getSettings();
    ChuckerFlutter.navigatorObserver.navigator!.push(
      MaterialPageRoute(
        builder: (context) => MaterialApp(
          key: const Key('chucker_material_app'),
          debugShowCheckedModeBanner: false,
          localizationsDelegates: Localization.localizationsDelegates,
          supportedLocales: Localization.supportedLocales,
          locale: Localization.currentLocale,
          theme: ThemeData(
            tabBarTheme: TabBarTheme(
              labelColor: Colors.white,
              labelStyle: context.textTheme.bodyText1,
            ),
            backgroundColor: primaryColor,
          ),
          home: const ChuckerPage(),
        ),
      ),
    );
  }
}

///[ChuckerFlutter] is a helper class to initialize the library
///
///[chuckerButton] and notifications only be visible in debug mode
class ChuckerFlutter {
  ///[navigatorObserver] observes the navigation of your app. It must be
  ///referenced in your MaterialApp widget
  static final navigatorObserver = NavigatorObserver();

  ///[showOnRelease] decides whether to allow Chucker Flutter working in release
  ///mode or not.
  ///By default its value is `false`
  static bool showOnRelease = false;

  ///[isDebugMode] A wrapper of Flutter's `kDebugMode` constant
  static bool isDebugMode = kDebugMode;

  ///[ChuckerButton] can be placed anywhere in the UI to open Chucker Screen
  static final chuckerButton = isDebugMode || ChuckerFlutter.showOnRelease
      ? ChuckerButton.getInstance()
      : const SizedBox.shrink();
}
