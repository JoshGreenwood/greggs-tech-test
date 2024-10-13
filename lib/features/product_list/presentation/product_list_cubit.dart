import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:greggs_sausage_roll/core/result.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/fetch_products.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

import '../../../core/failure.dart';

part 'product_list_cubit.freezed.dart';
part 'product_list_state.dart';

class ProductListCubit extends Cubit<ProductListState> {
  final FetchProducts _fetchProducts;
  ProductListCubit(this._fetchProducts)
      : super(const ProductListState.initial());

  Future<void> load() async {
    emit(const ProductListState.loading());
    final products = await _fetchProducts();

    switch (products) {
      case SuccessResult(:final value):
        emit(ProductListState.loaded(products: value));
      case FailureResult(:final failure):
        emit(ProductListState.failure(failure: failure));
    }
  }
}
