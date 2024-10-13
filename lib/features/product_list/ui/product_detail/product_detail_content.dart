import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';

import '../../../../theme/spacing.dart';
import '../../domain/product.dart';

class ProductDetailContent extends StatelessWidget {
  final Product product;
  const ProductDetailContent({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              product.name,
              style: context.textTheme.titleLarge,
            ),
            const Spacer(),
            Text(
              product.eatOutPrice.formatted,
              style: context.textTheme.titleLarge,
            ),
          ],
        ),
        Spacing.vm,
        Text(product.description)
      ],
    );
  }
}
