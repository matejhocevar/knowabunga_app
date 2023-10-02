import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';

import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

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
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          restorationScopeId: 'app',
          localizationsDelegates: const [],
          supportedLocales: const [
            Locale('en', ''),
          ],
          onGenerateTitle: (_) => 'Knowabunga 2023',
          themeMode: settingsController.themeMode,
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
                  case SampleItemDetailsView.routeName:
                    return const SampleItemDetailsView();
                  case SampleItemListView.routeName:
                  default:
                    return SampleItemListView(controller: settingsController);
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
