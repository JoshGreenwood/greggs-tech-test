import 'package:decimal/decimal.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  const factory Product({
    required String name,
    required String description,
    required Decimal eatOutPrice,
    required String thumbnailUri,
    required String imageUri,
  }) = _Product;
}
