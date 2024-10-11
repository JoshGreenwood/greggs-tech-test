import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class DecimalResponseConverter implements JsonConverter<Decimal, double> {
  const DecimalResponseConverter();

  @override
  Decimal fromJson(double json) {
    return Decimal.fromJson(json.toStringAsFixed(2));
  }

  @override
  double toJson(Decimal object) {
    return object.toDouble();
  }
}
