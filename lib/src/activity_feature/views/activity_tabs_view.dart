import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:knowabunga_app/src/shared/widgets/app_background.dart';

import '../../settings/settings_controller.dart';
import '../activity_feature.dart';

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
        for (var json in (entry.value as List<dynamic>)) {
          json['day'] = entry.key;
          activities.add(Activity.fromJson(json));
        }
      });

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              SliverPersistentHeader(
                pinned: true,
                floating: true,
                delegate: ActivityHeader(controller: widget.controller),
              ),
              const SliverPersistentHeader(
                pinned: true,
                floating: false,
                delegate: ActivityHeaderTabs(),
              ),
            ];
          },
          body: AppBackground(
            child: TabBarView(
              children: [
                ActivityList(
                  items: activities
                      .where((a) => a.day == ActivityDay.day1)
                      .toList(),
                ),
                ActivityList(
                  items: activities
                      .where((a) => a.day == ActivityDay.day2)
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
