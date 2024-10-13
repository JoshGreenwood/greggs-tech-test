import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

part 'cart.freezed.dart';

@freezed
class Cart with _$Cart {
  const Cart._();
  const factory Cart({
    @Default([]) List<Product> items,
  }) = _Cart;

  Cart addProduct(Product product) {
    return copyWith(items: items + [product]);
  }
}
