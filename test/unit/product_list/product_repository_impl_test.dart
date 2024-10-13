import 'package:decimal/decimal.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:greggs_sausage_roll/core/failure.dart';
import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/features/product_list/data/file_data_source.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_repository_impl.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_response.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'product_repository_impl_test.mocks.dart';

@GenerateMocks([FileProductDataSource])
void main() {
  group(ProductRepositoryImpl, () {
    provideDummy<Result<List<ProductResponse>>>(Result.success([]));

    late MockFileProductDataSource dataSource;
    late ProductRepositoryImpl repository;

    setUp(() {
      dataSource = MockFileProductDataSource();
      repository = ProductRepositoryImpl(dataSource);
    });

    test('Should return a product given a single product is fetched', () async {
      final response = ProductResponse(
          articleName: 'name',
          customerDescription: 'description',
          eatOutPrice: Decimal.fromJson('1.20'),
          thumbnailUri: '',
          imageUri: '',
          articleCode: '');

      when(dataSource.fetch())
          .thenAnswer((_) async => Result.success([response]));

      final result = await repository.allProducts();

      final actual = [
        Product(
            name: 'name',
            description: 'description',
            eatOutPrice: Decimal.fromJson('1.20'),
            thumbnailUri: '',
            imageUri: '',
            code: '')
      ];

      expect((result as SuccessResult).value, actual);
    });

    test('Should return a failure given a failure is fetched', () async {
      when(dataSource.fetch())
          .thenAnswer((_) async => Result.failure(IOFailure()));

      final result = await repository.allProducts();

      expect((result as FailureResult).failure, IOFailure());
    });
  });
}
