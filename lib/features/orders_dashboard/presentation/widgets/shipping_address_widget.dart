import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/text_tile_widget.dart';

class ShippingAddressWidget extends StatelessWidget {
  const ShippingAddressWidget({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipping Address:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        TitleTextWidget(title: "Name: ",value:  order.shippingAddressEntity.name ?? "N/A"),
        TitleTextWidget(title:"Email: ",value: order.shippingAddressEntity.email ?? "N/A"),
        TitleTextWidget(title:"City: ",value: order.shippingAddressEntity.city ?? "N/A"),
        TitleTextWidget(title:"Address: ",value: order.shippingAddressEntity.address ?? "N/A"),
        TitleTextWidget(title:"Flat No.: ",value: order.shippingAddressEntity.flatNumber ?? "N/A"),
        TitleTextWidget(title:"Phone: ",value:order.shippingAddressEntity.phoneNumber?.toString() ?? "N/A"),
      ],
    );
  }
}