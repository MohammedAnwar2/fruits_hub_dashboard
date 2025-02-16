import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';

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
                _buildOrderDetails(),
                const Divider(thickness: 1),
                // Products List
                _buildProductsList(),

                const Divider(thickness: 1),

                // Shipping Address
                _buildShippingAddress(),
              ],
            ),
          ),
        ),
        if (order.status <= 3)
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CustomButton(
                          text: "Next Status",
                          onPressed: ()async {
                            // print("Next Status");
                            await   context.read<OrdersDashboardCubit>().nextStatus(order, order.status + 1);

                          })),
                  const SizedBox(width: 3),
                  Expanded(
                      child: CustomButton(
                          text: "Previous Status", onPressed: () {})),
                ],
              ),
              const SizedBox(height: 10),
              CustomButton(text: "Cancel Order", onPressed: () {}),
              const SizedBox(height: 20),
            ],
          ),
      ],
    );
  }

  /// Builds the order details section
  Widget _buildOrderDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitleText("Order ID: ", order.uid),
        _buildTitleText("Status: ", order.status.toString()),
        _buildTitleText(
            "Total Price: ", "\$${order.totalPrice.toStringAsFixed(2)}"),
        _buildTitleText("Payment: ",
            order.payWithCash ? "Cash on Delivery" : "Paid Online"),
        _buildTitleText(
            "Order Date: ", "${order.orderDate.toLocal()}".split(' ')[0]),
      ],
    );
  }

  /// Builds the list of ordered products
  Widget _buildProductsList() {
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

  /// Builds the shipping address section
  Widget _buildShippingAddress() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Shipping Address:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 6),
        _buildTitleText("Name: ", order.shippingAddressEntity.name ?? "N/A"),
        _buildTitleText("Email: ", order.shippingAddressEntity.email ?? "N/A"),
        _buildTitleText("City: ", order.shippingAddressEntity.city ?? "N/A"),
        _buildTitleText(
            "Address: ", order.shippingAddressEntity.address ?? "N/A"),
        _buildTitleText(
            "Flat No.: ", order.shippingAddressEntity.flatNumber ?? "N/A"),
        _buildTitleText("Phone: ",
            order.shippingAddressEntity.phoneNumber?.toString() ?? "N/A"),
      ],
    );
  }

  /// Builds a formatted rich text row
  Widget _buildTitleText(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
                text: title,
                style: const TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }
}
