import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/features/cart/domain/cart.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

void main() {
  group(Cart, () {
    late Cart cart;

    final product1 = Product(
        name: 'name',
        description: 'description',
        eatOutPrice: Decimal.fromJson('1.20'),
        thumbnailUri: '',
        imageUri: '',
        code: '1');

    final product2 = Product(
        name: 'namew',
        description: 'description2',
        eatOutPrice: Decimal.fromJson('0.12'),
        thumbnailUri: '',
        imageUri: '',
        code: '2');

    setUp(() {
      cart = const Cart();
    });

    test('Should have no items by default', () {
      expect(cart.items, isEmpty);
      expect(cart.itemCount, isZero);
    });

    test('Should calculate the price Given one item has been added', () {
      cart = cart.addProduct(product1);

      expect(cart.itemCount, 1);
      expect(cart.totalPrice, Decimal.fromJson('1.20'));
    });

    test('Should calculate the price Given two items has been added ', () {
      cart = cart.addProduct(product1);
      cart = cart.addProduct(product2);

      expect(cart.itemCount, 2);
      expect(cart.totalPrice, Decimal.fromJson('1.32'));
    });

    test('Shouqweweeld remove an item', () {
      cart = cart.addProduct(product1);
      cart = cart.addProduct(product1);
      cart = cart.addProduct(product2);
      cart = cart.addProduct(product2);
      cart = cart.addProduct(product2);

      expect(cart.countedItems, {product1: 2, product2: 3});
      expect(cart.itemCount, 5);
    });

    test('Should remove an item', () {
      cart = cart.addProduct(product1);
      cart = cart.removeProduct(product1);

      expect(cart.itemCount, 0);
      expect(cart.totalPrice, Decimal.zero);
    });
  });
}
