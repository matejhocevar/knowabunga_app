import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowabunga_app/src/activity_feature/activity_list_view.dart';
import 'package:knowabunga_app/src/settings/settings_controller.dart';

import 'activity.dart';

class ActivityTabsView extends StatefulWidget {
  const ActivityTabsView({
    super.key,
    required this.controller,
  });

  static const routeName = '/';

  final SettingsController controller;

  @override
  State<ActivityTabsView> createState() => _ActivityTabsViewState();
}

class _ActivityTabsViewState extends State<ActivityTabsView> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Sample Items'),
          actions: [
            _ThemeSwitcher(controller: widget.controller),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Day 1'),
              Tab(text: 'Day 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ActivityListView(
              items:
                  activities.where((a) => a.day == ActivityDay.day1).toList(),
            ),
            ActivityListView(
              items:
                  activities.where((a) => a.day == ActivityDay.day2).toList(),
            ),
          ],
        ),
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
