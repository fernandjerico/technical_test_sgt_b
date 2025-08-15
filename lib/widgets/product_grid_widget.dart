import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:technical_test_sgt_b/widgets/product_item_widget.dart';

class ProductGridWidget extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Function(Map<String, dynamic>)? onItemTap;

  const ProductGridWidget({
    super.key,
    required this.items,
    this.onItemTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: MasonryGridView.builder(
        itemCount: items.length,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: EdgeInsets.all(4),
            child: ProductItemWidget(
              item: item,
              onTap: () => onItemTap?.call(item),
            ),
          );
        },
      ),
    );
  }
}
