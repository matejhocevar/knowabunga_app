import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/activity_feature/activity_feature.dart';
import 'package:knowabunga_app/src/shared/widgets/app_background.dart';
import 'package:knowabunga_app/src/utils/string_extensions.dart';

import '../../shared/widgets/icon_text.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({
    super.key,
    required this.activity,
  });

  static const routeName = '/activity';

  final Activity? activity;

  @override
  Widget build(BuildContext context) {
    Widget? body;

    if (activity == null) {
      body = Container();
    } else {
      body = _ActivityDetails(activity: activity!);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 8),
              height: 64,
              child: Image.asset(
                'assets/images/logo.png',
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                'About the ${activity?.friendlyType ?? "Unknown"}',
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
      ),
      body: AppBackground(
        child: body,
      ),
    );
  }
}

class _ActivityDetails extends StatelessWidget {
  const _ActivityDetails({required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return ListView(
      padding: EdgeInsets.symmetric(horizontal: screenWidth / 10),
      children: [
        const SizedBox(height: 32),
        Align(
          alignment: Alignment.topCenter,
          child: SizedBox(
            width: min(screenWidth / 2, 400),
            child: ActivityThumbnail(
              image: activity.image,
              tag: activity.tag,
              size: min(screenWidth / 2, 400),
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (activity.speakers.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 124),
            child: Text(
              activity.speakers.smartJoin(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
        Text(
          activity.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconText(
              icon: const Icon(Icons.access_time, size: 16),
              text: '${activity.timeStart} - ${activity.timeEnd}',
            ),
            const SizedBox(width: 8),
            IconText(
              icon: const Icon(Icons.location_on_outlined, size: 16),
              text: activity.location,
            ),
          ],
        ),
        const SizedBox(height: 8),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 8,
          children: <Widget>[
            ...activity.tags
                .map(
                  (t) => ActivityChip(
                    text: t.split('.').last.replaceAll('_', ' ').capitalize(),
                  ),
                )
                .toList(),
          ],
        ),
        const SizedBox(height: 16),
        Text(
          activity.description,
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
