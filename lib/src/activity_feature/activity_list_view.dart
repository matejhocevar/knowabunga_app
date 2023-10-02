import 'package:flutter/material.dart';

import 'activity.dart';
import 'activity_tile.dart';

class ActivityListView extends StatelessWidget {
  const ActivityListView({
    super.key,
    this.items = const [],
  });

  final List<Activity> items;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      restorationId: 'activitiesListView',
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return ActivityTile(activity: items[index]);
      },
    );
  }
}
