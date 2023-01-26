import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:get/get.dart';
import 'package:wagyufari/features/app/app.dart';
import 'package:wagyufari/features/app/screens/gears_screen.dart';
import 'package:wagyufari/features/app/screens/home_screen.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  usePathUrlStrategy();
  runApp(Phoenix(child: App()));


  // runApp(Phoenix(child: Web(storeId: -1)));
}