import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/widgets/order_archive_view_body.dart';

class OrderArchiveView extends StatelessWidget {
  const OrderArchiveView({super.key});
  static const routeName = 'order_archive_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrdersDashboardCubit>()..getArchivedOrders(), 
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Archive'),
        body: OrderArchiveViewBody(),
      ),
    );
  }
}
