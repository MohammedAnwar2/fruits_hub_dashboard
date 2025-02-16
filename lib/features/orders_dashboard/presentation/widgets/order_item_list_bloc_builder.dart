import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/order_dashboard_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'order_item_list.dart';

class OrderItemListBlocBuilder extends StatelessWidget {
  const OrderItemListBlocBuilder({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersDashboardCubit, OrdersDashboardState>(
      builder: (context, state) {
        
        if (state is OrdersDashboardSuccess) {
          if (state.orders.isEmpty) {
            return Center(
              child: Text('No Orders Found'),
            );
          }
          return OrderItemList(orders: state.orders);
        } else if (state is OrdersDashboardError) {
          return Center(
            child: Text(state.message),
            );
        }
        else {
          return  Skeletonizer(enabled: true,child: OrderItemList(orders: getDummyOrders()));
        }
      },
    );
  }
}
