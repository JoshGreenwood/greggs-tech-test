import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_response.dart';

class FileProductDataSource {
  FutureResult<List<ProductResponse>> fetch() async {
    final String response =
        await rootBundle.loadString('assets/json/sausage_roll.json');
    final decoded = await json.decode(response) as List<dynamic>;
    final products = decoded.map(_responseFromJson).toList();
    return Result.success(products);
  }

  ProductResponse _responseFromJson(dynamic response) =>
      ProductResponse.fromJson(response as Map<String, dynamic>);
}
