import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_detail/product_detail_view.dart';

import '../../../../Keys.dart';
import '../../../../components/product_list_item.dart';
import '../../domain/product.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;

  const ProductList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: products.length,
      itemBuilder: _buildItem,
      separatorBuilder: _buildSeparator,
    );
  }

  Widget _buildItem(BuildContext context, int index) {
    final product = products[index];
    return ProductListItem(
      product: product,
      onTap: (product) => _showDetail(context, product),
      trailing: ElevatedButton(
          key: Keys.productAddListItem,
          onPressed: () => _addItem(context, product),
          child: Text(context.localizations.addItem)),
    );
  }

  void _addItem(BuildContext context, Product product) =>
      context.read<CartCubit>().addProduct(product);

  Future<void> _showDetail(BuildContext context, Product product) =>
      context.push<void>((_) => ProductDetailView(product: product));

  Widget _buildSeparator(BuildContext context, int index) {
    return const Divider(height: 1);
  }
}
