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
        side: const BorderSide(color: AppColors.gray, width: 1),
        label: Text(text),
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
          fontSize: 16,
          color: AppColors.gray,
        ),
        backgroundColor: Colors.transparent,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
