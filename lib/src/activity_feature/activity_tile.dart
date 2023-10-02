import 'package:flutter/material.dart';
import 'package:knowabunga_app/src/shared/widgets/icon_text.dart';
import 'package:knowabunga_app/src/utils/string_extensions.dart';

import 'activity.dart';
import 'activity_chip.dart';
import 'activity_details_view.dart';

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
          children: [
            _ActivityThumbnail(image: activity.image),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  IconText(
                    icon: const Icon(Icons.access_time, size: 16),
                    text: '${activity.timeStart} - ${activity.timeEnd}',
                  ),
                  Text(
                    activity.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(height: 8),
                  IconText(
                    icon: const Icon(Icons.location_on_outlined, size: 16),
                    text: activity.location,
                  ),
                  const SizedBox(height: 8),
                  Row(
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

class _ActivityThumbnail extends StatelessWidget {
  const _ActivityThumbnail({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }
}
