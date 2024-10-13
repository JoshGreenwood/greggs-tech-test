import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_detail/product_detail_view.dart';

import '../../../components/image_panel.dart';
import '../../../theme/spacing.dart';
import '../domain/product.dart';

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

  Widget? _buildItem(BuildContext context, int index) {
    final product = products[index];
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push(ProductDetailView(product: product)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: Spacing.page, vertical: Spacing.s),
        child: Row(
          children: [
            ImagePanel(
              uri: product.thumbnailUri,
              label: product.name,
              width: 100,
            ),
            Spacing.hm,
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name),
                  Text(product.eatOutPrice.formatted),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return const Divider(height: 1);
  }
}
