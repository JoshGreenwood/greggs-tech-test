import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greggs_sausage_roll/core/context_extensions.dart';
import 'package:greggs_sausage_roll/core/decimal_extensions.dart';

import '../../../components/page_footer.dart';
import '../../../theme/spacing.dart';
import '../presentation/cart_cubit.dart';

class CartFooter extends StatelessWidget {
  const CartFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return PageFooter(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: OutlinedButton(
                  onPressed: () => _emptyCart(context),
                  child: Text(context.localizations.clearCart)),
            ),
            Spacing.hm,
            Expanded(
              flex: 3,
              child: ElevatedButton(
                  onPressed: () {},
                  child: Text(context.localizations
                      .checkout(state.cart.totalPrice.formatted))),
            ),
          ],
        ));
      },
    );
  }

  Future<void> _emptyCart(BuildContext context) async {
    context.pop<void>();
    context.read<CartCubit>().emptyCart();
  }
}
