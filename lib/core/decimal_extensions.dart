import 'package:decimal/decimal.dart';
import 'package:decimal/intl.dart';
import 'package:intl/intl.dart';

final _currencyFormat =
    DecimalFormatter(NumberFormat.simpleCurrency(locale: 'en_gb'));

extension DecimalExtensions on Decimal {
  String get formatted => _currencyFormat.format(this);
}
