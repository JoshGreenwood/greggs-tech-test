import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/components/thumbnail_image.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:greggs_sausage_roll/theme/app_colours.dart';

import '../../../theme/spacing.dart';

class ProductDetailView extends StatelessWidget {
  final Product product;

  const ProductDetailView({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(Spacing.page),
            child: Column(
              children: [
                ThumbnailImage(
                  uri: product.imageUri,
                  label: product.name,
                  width: double.maxFinite,
                ),
                Spacing.vl,
                _buildProductContent(context),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: ProductDetailFooter(product: product),
          )
        ],
      ),
    );
  }

  Widget _buildProductContent(BuildContext context) {
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

class ProductDetailFooter extends StatelessWidget {
  final Product product;
  const ProductDetailFooter({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.primary,
      child: SafeArea(
        top: false,
        minimum: const EdgeInsets.symmetric(
            horizontal: Spacing.m, vertical: Spacing.s),
        child: ElevatedButton(
          onPressed: () {},
          child: Text(
              context.localizations.addToCart(product.eatOutPrice.formatted)),
        ),
      ),
    );
  }
}
