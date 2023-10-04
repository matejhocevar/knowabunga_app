import 'package:flutter/material.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/bg.png',
          ),
          alignment: Alignment.topLeft,
          repeat: ImageRepeat.repeat,
          opacity: 0.75,
        ),
      ),
      child: child,
    );
  }
}
