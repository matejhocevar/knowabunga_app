import 'dart:math';

import 'package:flutter/material.dart';

import '../../../constants/constants.dart';
import '../../../shared/widgets/shapes/circle.dart';
import '../../../shared/widgets/shapes/semicircle.dart';

class ActivityEmptyStateCustom extends StatelessWidget {
  const ActivityEmptyStateCustom({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      height: screenSize.height,
      width: double.infinity,
      padding: EdgeInsets.all(screenSize.width / 8),
      child: const SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _CustomAnimation(),
            Text(
              "You’re challenged to share your knowledge next time!",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomAnimation extends StatefulWidget {
  const _CustomAnimation();

  @override
  State<_CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<_CustomAnimation>
    with TickerProviderStateMixin {
  late final AnimationController animationController;
  late final Animation<double> slideAnimation;
  late final Animation<double> swingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    final curvedAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOutCubic,
    );

    slideAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(curvedAnimation);
    swingAnimation = Tween<double>(
      begin: 20 * pi / 180,
      end: -20 * pi / 180,
    ).animate(curvedAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double size = constraints.maxWidth * 0.55;

      return AspectRatio(
        aspectRatio: 1,
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            return Transform.rotate(
              angle: swingAnimation.value,
              alignment: Alignment.center,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  AnimatedBuilder(
                    animation: animationController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(
                          -(size / 2) + (size * slideAnimation.value),
                          -(0.45 * size),
                        ),
                        child: Circle(
                          color: AppColors.primarySeedColor,
                          diameter: size / 2.5,
                        ),
                      );
                    },
                  ),
                  Semicircle(
                    color: AppColors.primarySeedColor,
                    width: size,
                  ),
                ],
              ),
            );
          },
        ),
      );
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
