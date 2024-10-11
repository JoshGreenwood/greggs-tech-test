import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greggs_sausage_roll/core/decimal_response_converter.dart';

part 'product_response.freezed.dart';
part 'product_response.g.dart';

@freezed
class ProductResponse with _$ProductResponse {
  const factory ProductResponse({
    required String articleName,
    required String customerDescription,
    @DecimalResponseConverter() required Decimal eatOutPrice,
    required String thumbnailUri,
    required String imageUri,
  }) = _ProductResponse;

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}
