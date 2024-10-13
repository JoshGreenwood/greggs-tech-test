import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/features/cart/domain/cart.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

void main() {
  group(Cart, () {
    late Cart cart;

    setUp(() {
      cart = const Cart();
    });

    test('Should have no items by default', () {
      expect(cart.items, isEmpty);
      expect(cart.itemCount, isZero);
    });

    test('Should calculate the price Given one item has been added', () {
      cart = cart.addProduct(Product(
          name: 'name',
          description: 'description',
          eatOutPrice: Decimal.fromJson('1.20'),
          thumbnailUri: '',
          imageUri: ''));

      expect(cart.itemCount, 1);
      expect(cart.totalPrice, Decimal.fromJson('1.20'));
    });

    test('Should calculate the price Given two items has been added ', () {
      cart = cart.addProduct(Product(
          name: 'name',
          description: 'description',
          eatOutPrice: Decimal.fromJson('1.20'),
          thumbnailUri: '',
          imageUri: ''));

      cart = cart.addProduct(Product(
          name: 'name',
          description: 'description',
          eatOutPrice: Decimal.fromJson('0.12'),
          thumbnailUri: '',
          imageUri: ''));

      expect(cart.itemCount, 2);
      expect(cart.totalPrice, Decimal.fromJson('1.32'));
    });

    test('Should remove an item', () {
      cart = cart.addProduct(Product(
          name: 'name',
          description: 'description',
          eatOutPrice: Decimal.fromJson('1.20'),
          thumbnailUri: '',
          imageUri: ''));

      cart = cart.removeProduct(Product(
          name: 'name',
          description: 'description',
          eatOutPrice: Decimal.fromJson('1.20'),
          thumbnailUri: '',
          imageUri: ''));

      expect(cart.itemCount, 0);
      expect(cart.totalPrice, Decimal.zero);
    });
  });
}
