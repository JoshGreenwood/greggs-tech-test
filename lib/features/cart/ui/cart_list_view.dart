import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/components/product_list_item.dart';
import 'package:greggs_sausage_roll/components/text_badge.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/features/cart/presentation/cart_cubit.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';

import 'cart_footer.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.localizations.cartPageTitle),
        ),
        body: Stack(
          children: [
            BlocBuilder<CartCubit, CartState>(builder: (context, state) {
              final cartItems = state.cart.countedItems.entries.toList();
              return ListView.separated(
                  separatorBuilder: _buildSeparator,
                  itemCount: cartItems.length,
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return _buildListItem(cartItem);
                  });
            }),
            const Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: CartFooter(),
            )
          ],
        ));
  }

  Widget _buildListItem(MapEntry<Product, int> cartItem) {
    final badge = TextBadge(
      text: cartItem.value.toString(),
      size: 24,
    );
    return ProductListItem(product: cartItem.key, action: badge);
  }

  Widget _buildSeparator(BuildContext context, int index) {
    return const Divider(height: 1);
  }
}
