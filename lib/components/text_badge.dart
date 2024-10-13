import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/theme/app_colours.dart';

class TextBadge extends StatelessWidget {
  final String text;
  final double size;
  const TextBadge({
    super.key,
    required this.text,
    this.size = 24,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size),
          color: AppColours.secondary),
      child: Center(
          child: Text(
        text,
        style: context.textTheme.titleMedium
            ?.copyWith(color: AppColours.primary, fontWeight: FontWeight.w600),
      )),
    );
  }
}
