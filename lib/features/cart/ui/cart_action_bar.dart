import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';
import 'package:greggs_sausage_roll/features/cart/ui/cart_list_view.dart';

import '../../../Keys.dart';
import '../../../components/text_badge.dart';
import '../../../theme/app_colours.dart';
import '../../../theme/spacing.dart';
import '../presentation/cart_cubit.dart';

class CartPreviewView extends StatelessWidget {
  const CartPreviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: _animationBuilder,
          child: state.cart.itemCount == 0
              ? const SizedBox.shrink()
              : Container(
                  margin: const EdgeInsets.symmetric(
                      horizontal: Spacing.l, vertical: Spacing.xl),
                  padding: const EdgeInsets.symmetric(
                      horizontal: Spacing.l, vertical: Spacing.m),
                  decoration: BoxDecoration(
                      color: AppColours.primary,
                      borderRadius: BorderRadius.circular(16)),
                  child: _buildButton(context, state),
                ),
        );
      },
    );
  }

  Widget _buildButton(BuildContext context, CartState state) {
    return ElevatedButton(
      key: Keys.viewCartButton,
      onPressed: () => context.push<void>((context) => const CartListView()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.shopping_cart),
          Text(context.localizations.viewCart(state.cart.totalPrice.formatted)),
          TextBadge(
            text: state.cart.itemCount.toString(),
            size: 24,
          )
        ],
      ),
    );
  }

  Widget _animationBuilder(Widget widget, Animation<double> animation) =>
      ScaleTransition(
          scale: CurvedAnimation(
            parent: animation,
            curve: const ElasticOutCurve(1),
          ),
          child: widget);
}
