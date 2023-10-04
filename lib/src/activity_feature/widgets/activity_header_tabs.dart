import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ActivityHeaderTabs implements SliverPersistentHeaderDelegate {
  const ActivityHeaderTabs();

  @override
  double get maxExtent => 40;

  @override
  double get minExtent => 40;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    ColorScheme colors = Theme.of(context).colorScheme;

    return Container(
      color: Theme.of(context).secondaryHeaderColor,
      child: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 4,
        unselectedLabelColor: colors.primary,
        tabs: const [
          Tab(text: 'Friday'),
          Tab(text: 'Saturday'),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
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
