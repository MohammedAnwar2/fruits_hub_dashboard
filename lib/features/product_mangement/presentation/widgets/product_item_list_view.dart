import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/product_item.dart';

class ProductItemListView extends StatelessWidget {
  const ProductItemListView({
    super.key, required this.products,
  });
  final List<ProductEntities> products;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (BuildContext context, int index) {
        return ProductItem(product: products[index]);
      },
    );
  }
}