import 'package:flutter/material.dart';

import '../../constants/constants.dart';

class ActivityChip extends StatelessWidget {
  const ActivityChip({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: Chip(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        side: const BorderSide(color: AppColors.gray, width: 1),
        label: Text(text),
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
          fontSize: 14,
          color: AppColors.gray,
        ),
        backgroundColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
