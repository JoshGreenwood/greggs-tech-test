import 'package:bloc_test/bloc_test.dart';
import 'package:decimal/decimal.dart';
import 'package:greggs_sausage_roll/core/failure.dart';
import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/fetch_products.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:greggs_sausage_roll/features/product_list/presentation/product_list_cubit.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'product_list_cubit_test.mocks.dart';

@GenerateMocks([FetchProducts])
void main() {
  provideDummy<Result<List<Product>>>(Result.success([]));

  group(ProductListCubit, () {
    late MockFetchProducts fetchProducts;
    late ProductListCubit productListCubit;

    final product = Product(
        name: 'name',
        description: 'description',
        eatOutPrice: Decimal.fromJson('1.20'),
        thumbnailUri: '',
        imageUri: '',
        code: '');

    setUp(() {
      fetchProducts = MockFetchProducts();
      productListCubit = ProductListCubit(fetchProducts);
    });

    blocTest<ProductListCubit, ProductListState>(
      'Should have a loaded state with one product Given one product is fetched',
      build: () => productListCubit,
      setUp: () {
        when(fetchProducts.call())
            .thenAnswer((_) async => Result.success([product]));
      },
      act: (bloc) => bloc.load(),
      expect: () => [
        const ProductListState.loading(),
        ProductListState.loaded(products: [product])
      ],
    );

    blocTest<ProductListCubit, ProductListState>(
      'Should have a failure state Given one product is fetched',
      build: () => productListCubit,
      setUp: () {
        when(fetchProducts.call())
            .thenAnswer((_) async => Result.failure(IOFailure()));
      },
      act: (bloc) => bloc.load(),
      expect: () => [
        const ProductListState.loading(),
        ProductListState.failure(failure: IOFailure())
      ],
    );
  });
}
