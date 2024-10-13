import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

import '../domain/cart.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addProduct(Product product) {
    final cart = state.cart.addProduct(product);
    emit(CartState(cart: cart));
  }
}
