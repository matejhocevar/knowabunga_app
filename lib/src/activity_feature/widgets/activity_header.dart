import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:knowabunga_app/src/shared/widgets/theme_switcher.dart';

import '../../settings/settings_controller.dart';

class ActivityHeader implements SliverPersistentHeaderDelegate {
  const ActivityHeader({
    required this.controller,
  });

  final SettingsController controller;

  @override
  double get maxExtent => 250;

  @override
  double get minExtent => 50;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double progress = shrinkOffset / maxExtent;

    return Container(
      color: AppBarTheme.of(context).backgroundColor,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: 1 - progress,
              child: Image.asset('assets/images/logo.png'),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Opacity(
              opacity: progress,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'KB 2023',
                  style: TextStyle(
                    fontSize: 26,
                    color: AppBarTheme.of(context).foregroundColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12.0,
              ),
              child: ThemeSwitcher(controller: controller),
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration? get snapConfiguration => null;

  @override
  PersistentHeaderShowOnScreenConfiguration? get showOnScreenConfiguration =>
      null;

  @override
  OverScrollHeaderStretchConfiguration? get stretchConfiguration => null;

  @override
  TickerProvider? get vsync => null;
}
