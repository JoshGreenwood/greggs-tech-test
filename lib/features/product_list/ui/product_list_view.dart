import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/dependency_injection.dart';
import 'package:greggs_sausage_roll/features/product_list/presentation/product_list_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_list.dart';

import '../../../components/loading_spinner.dart';

class ProductListView extends StatefulWidget {
  const ProductListView({super.key});

  static Widget wrapped() {
    return BlocProvider(
      create: (context) => getIt<ProductListCubit>(),
      child: const ProductListView(),
    );
  }

  @override
  State<ProductListView> createState() => _ProductListViewState();
}

class _ProductListViewState extends State<ProductListView> {
  @override
  void initState() {
    super.initState();
    context.read<ProductListCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: BlocBuilder<ProductListCubit, ProductListState>(builder: _build));
  }

  Widget _build(BuildContext context, ProductListState state) =>
      switch (state) {
        LoadingState() => const LoadingSpinner(),
        LoadedState(products: final products) => RefreshIndicator(
            onRefresh: () => context.read<ProductListCubit>().load(),
            child: ProductList(products: products)),
        (_) => Container(),
      };
}
