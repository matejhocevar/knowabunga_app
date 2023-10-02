import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/activity_feature/activity_details_view.dart';
import 'package:knowabunga_app/src/settings/settings_controller.dart';

import 'activity.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({
    super.key,
    this.items = const [],
    required this.controller,
  });

  static const routeName = '/';

  final List<Activity> items;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample Items'),
        actions: [
          _ThemeSwitcher(controller: controller),
        ],
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = items[index];

          return ListTile(
            key: ValueKey(item.title),
            title: Text('SampleItem ${item.title}'),
            leading: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.greenAccent,
              ),
              width: 64,
            ),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                ActivityDetailsView.routeName,
              );
            },
          );
        },
      ),
    );
  }
}

class _ThemeSwitcher extends StatefulWidget {
  const _ThemeSwitcher({
    super.key,
    required this.controller,
  });

  final SettingsController controller;

  @override
  State<_ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<_ThemeSwitcher> {
  bool isLightMode() {
    return widget.controller.themeMode == ThemeMode.light;
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
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
