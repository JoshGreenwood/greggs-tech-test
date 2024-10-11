import 'package:greggs_sausage_roll/core/mapper.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_response.dart';

import '../domain/product.dart';

class ProductResponseMapper
    implements Mapper<List<ProductResponse>, List<Product>> {
  @override
  List<Product> map(List<ProductResponse> from) => from
      .map((response) => Product(
            name: response.articleName,
            description: response.customerDescription,
            eatOutPrice: response.eatOutPrice,
            thumbnailUri: response.thumbnailUri,
            imageUri: response.imageUri,
          ))
      .toList();
}
