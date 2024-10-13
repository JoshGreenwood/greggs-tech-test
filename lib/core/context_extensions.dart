import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  AppLocalizations get localizations => AppLocalizations.of(this)!;
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  Future<T?> push<T>(WidgetBuilder builder) =>
      Navigator.of(this).push(MaterialPageRoute<T>(builder: builder));

  void pop<T>({T? result}) => Navigator.of(this).pop(result);
}
