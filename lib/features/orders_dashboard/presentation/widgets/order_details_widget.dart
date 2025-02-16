import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/text_tile_widget.dart';

class OrderDetailsWidget extends StatelessWidget {
  const OrderDetailsWidget({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleTextWidget(title: "Order ID: ",value:  order.orderid),
        TitleTextWidget(title: "Status: ",value:  order.status.toString()),
        TitleTextWidget(title: 
            "Total Price: ",value:  "\$${order.totalPrice.toStringAsFixed(2)}"),
        TitleTextWidget(title: "Payment: ",value: 
            order.payWithCash ? "Cash on Delivery" : "Paid Online"),
        TitleTextWidget(title: 
            "Order Date: ",value:  "${order.orderDate.toLocal()}".split(' ')[0]),
      ],
    );
  }
}