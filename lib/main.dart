import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setPathUrlStrategy();

  final settingsController = SettingsController();

  runApp(MyApp(settingsController: settingsController));
}
