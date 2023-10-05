import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/shared/widgets/icon_text.dart';
import 'package:knowabunga_app/src/utils/string_extensions.dart';

import '../../constants/constants.dart';
import '../models/activity.dart';
import '../views/activity_details_view.dart';
import 'activity_chip.dart';
import 'activity_thumbnail.dart';

class ActivityTile extends StatelessWidget {
  const ActivityTile({super.key, required this.activity});

  final Activity activity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        constraints: const BoxConstraints(minHeight: 72),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivityThumbnail(
              image: activity.image,
              tag: activity.tag,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 4),
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
                  const SizedBox(height: 8),
                  Wrap(
                    children: <Widget>[
                      ...activity.tags
                          .map(
                            (t) => ActivityChip(
                              text: t
                                  .split('.')
                                  .last
                                  .replaceAll('_', ' ')
                                  .capitalize(),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      onTap: () {
        Navigator.restorablePushNamed(
          context,
          ActivityDetailsView.routeName,
          arguments: {'activity': activity.toJson()},
        );
      },
    );
  }
}
