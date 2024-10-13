import 'package:flutter/material.dart';

import '../theme/app_colours.dart';
import '../theme/spacing.dart';

class PageFooter extends StatelessWidget {
  final Widget child;
  const PageFooter({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.primary,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.symmetric(
            horizontal: Spacing.m, vertical: Spacing.s),
        child: child,
      ),
    );
  }
}
