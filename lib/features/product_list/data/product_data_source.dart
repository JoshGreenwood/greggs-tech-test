import 'package:greggs_sausage_roll/features/product_list/data/product_response.dart';

import '../../../core/result.dart';

abstract class ProductDataSource {
  FutureResult<List<ProductResponse>> fetch();
}
