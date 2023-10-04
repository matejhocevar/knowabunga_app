import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class ActivityEmptyStateRive extends StatelessWidget {
  const ActivityEmptyStateRive({super.key});

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
            AspectRatio(
              aspectRatio: 1,
              child: RiveAnimation.asset(
                'assets/animations/empty_state.riv',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 64),
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
