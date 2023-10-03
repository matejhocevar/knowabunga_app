import 'package:flutter/material.dart';

import '../models/activity.dart';
import 'activity_tile.dart';

class ActivityList extends StatelessWidget {
  const ActivityList({
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
