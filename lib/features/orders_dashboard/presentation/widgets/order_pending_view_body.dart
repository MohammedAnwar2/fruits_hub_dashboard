import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/order_item_list_bloc_builder.dart';

class OrderPendingViewBody extends StatelessWidget {
  const OrderPendingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontal),
      child: CustomScrollView(
        slivers: [
          OrderItemListBlocBuilder(),
        ],
      ),
    );
  }
}
