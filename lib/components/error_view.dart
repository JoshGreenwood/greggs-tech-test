import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';

import '../Keys.dart';
import '../theme/spacing.dart';

class ErrorView extends StatelessWidget {
  final VoidCallback onRetryTapped;
  const ErrorView({
    super.key,
    required this.onRetryTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            context.localizations.errorTitle,
            style: context.textTheme.titleLarge,
          ),
          Spacing.vm,
          ElevatedButton(
            key: Keys.retry,
            onPressed: onRetryTapped,
            child: Text(context.localizations.retry),
          )
        ],
      ),
    );
  }
}
