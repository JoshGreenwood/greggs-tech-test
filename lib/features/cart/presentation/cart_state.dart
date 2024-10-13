part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default(Cart()) Cart cart,
  }) = _CartState;
}
