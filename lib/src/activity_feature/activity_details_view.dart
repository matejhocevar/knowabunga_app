import 'package:flutter/material.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({super.key});

  static const routeName = '/activity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Activity Details'),
      ),
      body: const Center(
        child: Text('More Information Here'),
      ),
    );
  }
}
