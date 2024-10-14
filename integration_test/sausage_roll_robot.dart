import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/Keys.dart';
import 'package:greggs_sausage_roll/my_app.dart';

class SausageRollRobot {
  final WidgetTester _tester;

  SausageRollRobot(this._tester);

  Future<void> startApp() async {
    await _tester.pumpWidget(const MyApp());
    await _tester.pumpAndSettle();
  }

  Future<void> tapProductAtIndex(int index) async {
    final finder = find.byKey(Keys.productListItem).at(index);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }

  Future<void> tapAddProductAtIndex(int index) async {
    final finder = find.byKey(Keys.productAddListItem).at(index);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }

  void expectNumberOfProducts(int count) {
    final finder = find.byKey(Keys.productListItem);
    expect(finder, findsNWidgets(count));
  }

  Future<void> addProductToBasket() async {
    final finder = find.byKey(Keys.detailAddProduct);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }

  void expectViewCartIsVisible() {
    final finder = find.byKey(Keys.viewCartButton);
    expect(finder, findsOne);
  }

  void expectViewCartIsNotVisible() {
    final finder = find.byKey(Keys.viewCartButton);
    expect(finder, findsNothing);
  }

  Future<void> tapViewCart() async {
    final finder = find.byKey(Keys.viewCartButton);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }

  Future<void> tapEmptyCart() async {
    final finder = find.byKey(Keys.emptyCart);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }

  void expectCheckoutButton(double price) {
    final finder = find.text('Checkout - £${price.toStringAsFixed(2)}');
    expect(finder, findsOne);
  }

  void canSeeLabel(String text) {
    final finder = find.text(text);
    expect(finder, findsOne);
  }

  Future<void> tapRetry() async {
    final finder = find.byKey(Keys.retry);
    await _tester.tap(finder);
    await _tester.pumpAndSettle();
  }
}
