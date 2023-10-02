import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/settings/settings_controller.dart';

import 'sample_item.dart';
import 'sample_item_details_view.dart';

class SampleItemListView extends StatelessWidget {
  const SampleItemListView({
    super.key,
    this.items = const [SampleItem(1), SampleItem(2), SampleItem(3)],
    required this.controller,
  });

  static const routeName = '/';

  final List<SampleItem> items;
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
            title: Text('SampleItem ${item.id}'),
            leading: const CircleAvatar(
              foregroundImage: AssetImage('assets/images/flutter_logo.png'),
            ),
            onTap: () {
              Navigator.restorablePushNamed(
                context,
                SampleItemDetailsView.routeName,
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
