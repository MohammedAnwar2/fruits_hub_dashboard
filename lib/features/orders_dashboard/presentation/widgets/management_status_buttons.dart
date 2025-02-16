import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';

class ManagementStatusButtons extends StatelessWidget {
  const ManagementStatusButtons({
    super.key,
    required this.order,
  });

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                    text: "Previous Status", onPressed:order.status<1 ?null: () {
                      context.read<OrdersDashboardCubit>().previousStatus(order, order.status - 1);
                    })),
          ],
        ),
        const SizedBox(height: 10),
        CustomButton(text: "Cancel Order", onPressed: () {}),
        const SizedBox(height: 20),
      ],
    );
  }
}