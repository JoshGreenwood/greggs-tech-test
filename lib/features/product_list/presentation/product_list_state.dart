part of 'product_list_cubit.dart';

@freezed
class ProductListState with _$ProductListState {
  const factory ProductListState.initial() = InitialState;
  const factory ProductListState.loading() = LoadingState;
  const factory ProductListState.loaded({
    required List<Product> products,
  }) = LoadedState;

  const factory ProductListState.failure({
    required Failure failure,
  }) = FailureState;
}
