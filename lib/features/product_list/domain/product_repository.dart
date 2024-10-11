import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

import '../../../core/result.dart';

abstract class ProductRepository {
  Future<Result<List<Product>>> allProducts();
}
