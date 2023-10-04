import 'package:flutter/material.dart';

import '../../settings/settings_controller.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isLightMode() {
    return widget.controller.themeMode == ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: AppBarTheme.of(context).foregroundColor,
      icon: isLightMode()
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      onPressed: () {
        widget.controller.updateThemeMode(
          isLightMode() ? ThemeMode.dark : ThemeMode.light,
        );
      },
    );
  }
}
