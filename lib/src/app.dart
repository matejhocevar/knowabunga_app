import 'dart:convert';

import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowabunga_app/src/activity_feature/activity_details_view.dart';

import 'activity_feature/activity.dart';
import 'activity_feature/activity_list_view.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Activity> activities = [];

  @override
  void initState() {
    super.initState();

    rootBundle.loadString('assets/data/activities.json').then((String data) {
      var jsonMap = json.decode(data);
      activities = [];
      jsonMap.entries.forEach((entry) {
        (entry.value as List<dynamic>).forEach((dynamic json) {
          json['day'] = entry.key;
          activities.add(Activity.fromJson(json));
        });
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primarySeedColor = Color(0xFF3DB870);
    const Color secondarySeedColor = Color(0xFF000004);
    const Color tertiarySeedColor = Color(0xFF21418C);
    final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.light),
    );
    final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: primarySeedColor,
      secondaryKey: secondarySeedColor,
      tertiaryKey: tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.dark),
    );

    return ListenableBuilder(
      listenable: widget.settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (_) => 'Knowabunga 2023',
          themeMode: widget.settingsController.themeMode,
          theme: ThemeData(
            colorScheme: schemeLight,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: schemeDark,
            useMaterial3: true,
          ),
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case ActivityDetailsView.routeName:
                    return const ActivityDetailsView();
                  case ActivityListView.routeName:
                  default:
                    return ActivityListView(
                        controller: widget.settingsController);
                }
              },
            );
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
