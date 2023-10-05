import 'dart:math';

import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/activity_feature/activity_feature.dart';
import 'package:knowabunga_app/src/settings/settings_controller.dart';
import 'package:knowabunga_app/src/shared/widgets/app_background.dart';
import 'package:knowabunga_app/src/shared/widgets/theme_switcher.dart';
import 'package:knowabunga_app/src/utils/string_extensions.dart';

import '../../constants/constants.dart';
import '../../shared/widgets/icon_text.dart';

class ActivityDetailsView extends StatelessWidget {
  const ActivityDetailsView({
    super.key,
    required this.activity,
    required this.controller,
  });

  static const routeName = '/activity';

  final Activity? activity;
  final SettingsController controller;

  @override
  Widget build(BuildContext context) {
    Widget? body;

    if (activity == null) {
      body = const Placeholder(); // TODO(matej): Fix asap
    } else {
      body = _ActivityDetails(activity: activity!);
    }

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight + 8,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                activity?.title ?? 'Nothing here',
                overflow: TextOverflow.fade,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ThemeSwitcher(controller: controller),
          ),
        ],
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
        const SizedBox(height: 48),
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
        const SizedBox(height: 48),
        if (activity.speakers.isNotEmpty) ...[
          Text(
            activity.speakers.smartJoin(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 12),
        ],
        Text(
          activity.title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          children: <Widget>[
            IconText(
              icon: const Icon(
                Icons.access_time,
                size: 22,
                color: AppColors.gray,
              ),
              text: Text(
                '${activity.timeStart} - ${activity.timeEnd}',
                style: const TextStyle(color: AppColors.gray),
              ),
            ),
            const SizedBox(width: 12),
            IconText(
              icon: const Icon(
                Icons.location_on_outlined,
                size: 22,
                color: AppColors.gray,
              ),
              text: Text(
                activity.location,
                style: const TextStyle(color: AppColors.gray),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Wrap(
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
        const SizedBox(height: 24),
        Text(
          activity.description,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 64),
      ],
    );
  }
}
