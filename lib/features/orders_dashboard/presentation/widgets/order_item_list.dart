import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/order_item.dart';

class OrderItemList extends StatelessWidget {
  const OrderItemList({super.key, required this.orders});
  final List<OrderEntity> orders;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => OrderItem(order: orders[index]),
      itemCount: orders.length,
    );
  }
}
