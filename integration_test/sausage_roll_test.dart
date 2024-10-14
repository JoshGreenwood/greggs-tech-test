import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/core/failure.dart';
import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/dependency_injection.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_data_source.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_response.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sausage_roll_robot.dart';
import 'sausage_roll_test.mocks.dart';

@GenerateMocks([
  ProductDataSource,
])
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  provideDummy<Result<List<ProductResponse>>>(Result.success([]));

  final response = [
    ProductResponse(
        articleCode: '1',
        articleName: 'Test Sausage Roll',
        customerDescription: 'customerDescription',
        eatOutPrice: Decimal.fromJson('2.50'),
        thumbnailUri: 'https://articles.greggs.co.uk/images/1000446.png',
        imageUri: 'https://articles.greggs.co.uk/images/1000446.png'),
    ProductResponse(
        articleCode: '2',
        articleName: 'Test Sausage Roll 2',
        customerDescription: 'customerDescription',
        eatOutPrice: Decimal.fromJson('0.50'),
        thumbnailUri: 'https://articles.greggs.co.uk/images/1000446.png',
        imageUri: 'https://articles.greggs.co.uk/images/1000446.png')
  ];

  group('The Sausage Roll App', () {
    late MockProductDataSource productDataSource;
    setUp(() {
      DependencyInjection.initialise();
      productDataSource = MockProductDataSource();
      getIt.allowReassignment = true;
      getIt.registerSingleton<ProductDataSource>(productDataSource);
    });

    testWidgets('show a two products, view detail and add to cart',
        (tester) async {
      when(productDataSource.fetch())
          .thenAnswer((_) async => Result.success(response));

      final robot = SausageRollRobot(tester);
      await robot.startApp();
      robot.expectViewCartIsNotVisible();
      robot.expectNumberOfProducts(2);
      await robot.tapProductAtIndex(0);
      await robot.addProductToBasket();
      robot.expectViewCartIsVisible();
    });

    testWidgets('add two products to the cart, and view cart', (tester) async {
      when(productDataSource.fetch())
          .thenAnswer((_) async => Result.success(response));
      final robot = SausageRollRobot(tester);
      await robot.startApp();
      await robot.tapAddProductAtIndex(1);
      await robot.tapAddProductAtIndex(0);
      await robot.tapViewCart();
      robot.expectCheckoutButton(3.00);
    });

    testWidgets('add a product and empty cart', (tester) async {
      when(productDataSource.fetch())
          .thenAnswer((_) async => Result.success(response));
      final robot = SausageRollRobot(tester);
      await robot.startApp();
      await robot.tapAddProductAtIndex(1);
      await robot.tapViewCart();
      await robot.tapEmptyCart();
      robot.expectViewCartIsNotVisible();
    });

    testWidgets('show error state then retry', (tester) async {
      when(productDataSource.fetch())
          .thenAnswer((_) async => Result.failure(IOFailure()));
      final robot = SausageRollRobot(tester);
      await robot.startApp();
      robot.canSeeLabel('Opps! Something went wrong');

      when(productDataSource.fetch())
          .thenAnswer((_) async => Result.success(response));
      await robot.tapRetry();
      robot.expectNumberOfProducts(2);
    });
  });
}
