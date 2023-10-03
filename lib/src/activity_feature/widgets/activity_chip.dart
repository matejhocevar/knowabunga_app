import 'package:flutter/material.dart';

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
        label: Text(text),
        labelPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(fontSize: 12),
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
