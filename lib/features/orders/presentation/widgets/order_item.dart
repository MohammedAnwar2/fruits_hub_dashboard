import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/management_status_buttons.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_details_widget.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/products_list_widget.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/shipping_address_widget.dart';

class OrderItem extends StatelessWidget {
  final OrderEntity order;

  const OrderItem({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
   
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order Details
                OrderDetailsWidget(order: order),
                const Divider(thickness: 1),
                // Products List
                ProductsListWidget(order: order),
                const Divider(thickness: 1),
                // Shipping Address
                ShippingAddressWidget(order: order),
              ],
            ),
          ),
        ),
        if (order.status <= 4)
          ManagementStatusButtons(order: order),
      ],
    );
  }
}
