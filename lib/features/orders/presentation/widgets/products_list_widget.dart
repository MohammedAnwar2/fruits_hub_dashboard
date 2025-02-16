import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';

class ProductsListWidget extends StatelessWidget {
  const ProductsListWidget({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Products:",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Column(
          children: List.generate(
            order.productOrderEntity.length,
            (index) {
              final product = order.productOrderEntity[index];
              return ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(product.imageUrl,
                      width: 50, height: 50, fit: BoxFit.cover),
                ),
                title: Text(product.productName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(
                    "Price: \$${product.productPrice} x ${product.quantity}"),
              );
            },
          ),
        ),
      ],
    );
  }
}