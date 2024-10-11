import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product_repository.dart';

import '../../../core/result.dart';

class FetchProducts {
  final ProductRepository _productRepository;

  FetchProducts(this._productRepository);
  Future<Result<List<Product>>> call() async {
    return _productRepository.allProducts();
  }
}
