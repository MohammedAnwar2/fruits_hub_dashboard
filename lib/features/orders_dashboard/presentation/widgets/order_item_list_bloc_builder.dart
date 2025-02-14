import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/order_dashboard_dummy_data.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'order_item_list.dart';

class OrderItemListBlocBuilder extends StatefulWidget {
  const OrderItemListBlocBuilder({super.key});

  @override
  State<OrderItemListBlocBuilder> createState() =>
      _OrderItemListBlocBuilderState();
}

class _OrderItemListBlocBuilderState extends State<OrderItemListBlocBuilder> {
  late List<OrderEntity> ordersList;
  @override
  void initState() {
    ordersList = List.generate(10, (index) => getDummyOrder());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrdersDashboardCubit, OrdersDashboardState>(
      builder: (context, state) {
        if (state is OrdersDashboardSuccess) {
          return OrderItemList(orders: state.orders);
        } else if (state is OrdersDashboardError) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.message),
            ),
          );
        } else {
          return Skeletonizer.sliver(
              enabled: true, child: OrderItemList(orders: ordersList));
        }
      },
    );
  }
}
