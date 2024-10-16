import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/dependency_injection.dart';
import 'package:greggs_sausage_roll/features/product_list/presentation/product_list_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_list/product_list.dart';

import '../../../../components/error_view.dart';
import '../../../../components/loading_spinner.dart';
import '../../../cart/ui/cart_action_bar.dart';

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
    _load();
  }

  void _load() {
    context.read<ProductListCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(context.localizations.pageTitle)),
        body: Stack(
          children: [
            BlocBuilder<ProductListCubit, ProductListState>(builder: _build),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CartPreviewView(),
            ),
          ],
        ));
  }

  Widget _build(BuildContext context, ProductListState state) =>
      switch (state) {
        FailureState() => ErrorView(onRetryTapped: _load),
        LoadingState() => const LoadingSpinner(),
        LoadedState(products: final products) => RefreshIndicator(
            onRefresh: () => context.read<ProductListCubit>().load(),
            child: ProductList(products: products)),
        (_) => Container(),
      };
}
