import 'package:flutter/material.dart';

import 'activity.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({
    super.key,
    required this.activity,
  });

  static const routeName = '/activity';

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),
      body: Center(
        child: Text(activity.title),
      ),
    );
  }
}
