import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/features/product_list/data/file_data_source.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_response_mapper.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final FileProductDataSource _dataSource;

  ProductRepositoryImpl(this._dataSource);

  @override
  Future<Result<List<Product>>> allProducts() async {
    final response = await _dataSource.fetch();
    return response.mapSuccess(ProductResponseMapper());
  }
}
