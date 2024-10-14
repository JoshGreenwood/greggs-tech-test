import 'package:get_it/get_it.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/data/file_data_source.dart';
import 'package:greggs_sausage_roll/features/product_list/data/product_repository_impl.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/fetch_products.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product_repository.dart';
import 'package:greggs_sausage_roll/features/product_list/presentation/product_list_cubit.dart';

import 'features/product_list/data/product_data_source.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  DependencyInjection._();

  static void initialise() {
    //Data Sources
    getIt.registerLazySingleton<ProductDataSource>(
        () => FileProductDataSource());

    //Repositories
    getIt.registerLazySingleton<ProductRepository>(
        () => ProductRepositoryImpl(getIt()));

    //Usecases
    getIt.registerLazySingleton(() => FetchProducts(getIt()));

    //Cubits
    getIt.registerFactory(() => ProductListCubit(getIt()));
    getIt.registerFactory(() => CartCubit());
  }
}
