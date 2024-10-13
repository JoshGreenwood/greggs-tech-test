import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  Future<void> push(Widget widget) => Navigator.of(this)
      .push(MaterialPageRoute<void>(builder: (context) => widget));
}
