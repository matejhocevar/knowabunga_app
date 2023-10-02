import 'package:flutter/material.dart';

class ActivityChip extends StatelessWidget {
  const ActivityChip({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(text),
      labelPadding: EdgeInsets.zero,
      labelStyle: const TextStyle(fontSize: 12),
      visualDensity: VisualDensity.compact,
    );
  }
}
