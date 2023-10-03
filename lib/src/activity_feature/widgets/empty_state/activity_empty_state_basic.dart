import 'package:flutter/material.dart';

class ActivityEmptyStateBasic extends StatelessWidget {
  const ActivityEmptyStateBasic({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;

    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Oops! No activity found :/',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/gifs/pulp-fiction-john-travolta.gif',
            width: screenWidth / 2,
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
