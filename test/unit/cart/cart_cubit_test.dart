import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/features/cart/domain/cart.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

void main() {
  group(CartCubit, () {
    late CartCubit cartCubit;

    final product = Product(
        name: 'name',
        description: 'description',
        eatOutPrice: Decimal.fromJson('1.20'),
        thumbnailUri: '',
        imageUri: '');

    setUp(() {
      cartCubit = CartCubit();
    });

    blocTest<CartCubit, CartState>(
      'Should have cart state with items When items are added',
      build: () => cartCubit,
      act: (bloc) {
        bloc.addProduct(product);
        bloc.addProduct(product);
      },
      expect: () => [
        CartState(cart: Cart(items: [product])),
        CartState(cart: Cart(items: [product, product])),
      ],
    );
  });
}
