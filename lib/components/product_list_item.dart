import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';

import '../features/product_list/domain/product.dart';
import '../theme/spacing.dart';
import 'image_panel.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  final void Function(Product product)? onTap;
  final Widget? action;

  const ProductListItem({
    super.key,
    required this.product,
    this.onTap,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => onTap?.call(product),
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name),
                  Text(product.eatOutPrice.formatted),
                ],
              ),
            ),
            if (action != null) action!,
          ],
        ),
      ),
    );
  }
}
