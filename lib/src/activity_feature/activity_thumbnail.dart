import 'package:flutter/material.dart';

class ActivityThumbnail extends StatelessWidget {
  const ActivityThumbnail({
    super.key,
    required this.tag,
    required this.image,
    this.size = 100.0,
    this.fit = BoxFit.cover,
  });

  final String tag;
  final String image;
  final double size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: tag,
      child: Container(
        width: size,
        height: size,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: Image.asset(
          image,
          fit: fit,
        ),
      ),
    );
  }
}
