import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/utils/string_extensions.dart';

import '../shared/widgets/icon_text.dart';
import 'activity.dart';
import 'activity_chip.dart';
import 'activity_thumbnail.dart';

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
        title: Text('${activity.friendlyType} details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ActivityThumbnail(
              image: activity.image,
              tag: activity.tag,
              size: 256,
              fit: BoxFit.cover,
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
              const SizedBox(height: 16),
            ],
            Text(
              activity.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
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
                        text:
                            t.split('.').last.replaceAll('_', ' ').capitalize(),
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
        ),
      ),
    );
  }
}
