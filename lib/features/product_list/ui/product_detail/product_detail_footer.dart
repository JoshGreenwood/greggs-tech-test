import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';

import '../../../../theme/app_colours.dart';
import '../../../../theme/spacing.dart';
import '../../domain/product.dart';

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
          onPressed: () => _addToCart(context),
          child: Text(
              context.localizations.addToCart(product.eatOutPrice.formatted)),
        ),
      ),
    );
  }

  void _addToCart(BuildContext context) {
    context.read<CartCubit>().addProduct(product);
    context.pop<void>();
  }
}
