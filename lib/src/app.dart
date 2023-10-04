import 'package:flex_seed_scheme/flex_seed_scheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'activity_feature/activity_feature.dart';
import 'constants/constants.dart';
import 'settings/settings_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    final ColorScheme schemeLight = SeedColorScheme.fromSeeds(
      brightness: Brightness.light,
      primaryKey: AppColors.primarySeedColor,
      secondaryKey: AppColors.secondarySeedColor,
      tertiaryKey: AppColors.tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.light),
    );
    final ColorScheme schemeDark = SeedColorScheme.fromSeeds(
      brightness: Brightness.dark,
      primaryKey: AppColors.primarySeedColor,
      secondaryKey: AppColors.secondarySeedColor,
      tertiaryKey: AppColors.tertiarySeedColor,
      tones: FlexTones.vivid(Brightness.dark),
    );

    const AppBarTheme appBarTheme = AppBarTheme(
      centerTitle: true,
      toolbarHeight: kToolbarHeight + 128,
      scrolledUnderElevation: 1,
      elevation: 10,
      shadowColor: AppColors.secondarySeedColor,
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
          title: 'Knowabunga 2023',
          themeMode: settingsController.themeMode,
          theme: ThemeData(
            appBarTheme: appBarTheme,
            colorScheme: schemeLight,
            useMaterial3: true,
            fontFamily: GoogleFonts.sora().fontFamily,
          ),
          darkTheme: ThemeData(
            appBarTheme: appBarTheme,
            colorScheme: schemeDark,
            useMaterial3: true,
            fontFamily: GoogleFonts.sora().fontFamily,
          ),
          onGenerateRoute: (RouteSettings routeSettings) {
            switch (routeSettings.name) {
              case ActivityDetailsView.routeName:
                {
                  Activity? activity = Activity.fromJson((routeSettings
                      .arguments as Map<String, dynamic>)['activity']);

                  if (activity.title == 'Slackline') {
                    activity = null;
                  }

                  return MaterialPageRoute<void>(
                    settings: routeSettings,
                    builder: (BuildContext context) {
                      return ActivityDetailsView(
                        activity: activity,
                        controller: settingsController,
                      );
                    },
                  );
                }

              case ActivityTabsView.routeName:
              case '' || '/':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) {
                    return ActivityTabsView(
                      controller: settingsController,
                    );
                  },
                );
            }

            return null;
          },
          onUnknownRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                return ActivityDetailsView(
                  activity: null,
                  controller: settingsController,
                );
              },
            );
          },
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
