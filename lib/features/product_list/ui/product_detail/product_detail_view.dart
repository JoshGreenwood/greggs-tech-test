import 'package:flutter/material.dart';
import 'package:greggs_sausage_roll/components/image_panel.dart';
import 'package:greggs_sausage_roll/features/product_list/domain/product.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_detail/product_detail_content.dart';
import 'package:greggs_sausage_roll/features/product_list/ui/product_detail/product_detail_footer.dart';

import '../../../../theme/spacing.dart';

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
                ImagePanel(uri: product.imageUri, label: product.name),
                Spacing.vl,
                ProductDetailContent(product: product),
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
}
