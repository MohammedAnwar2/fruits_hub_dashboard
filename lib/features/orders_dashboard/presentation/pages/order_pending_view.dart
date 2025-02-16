import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/cubit/orders_mangement_status_cubit/orders_mangement_status_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/order_pending_view_body.dart';

class OrderPendingView extends StatelessWidget {
  const OrderPendingView({super.key});
  static const routeName = 'order_pending_view';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<OrdersDashboardCubit>(
          create: (context) => getIt<OrdersDashboardCubit>()
        ),
        BlocProvider<OrdersMangementStatusCubit>(
          create: (context) => getIt<OrdersMangementStatusCubit>()
        ),
      ],
      child: Scaffold(
        appBar: CustomAppBar(title: 'Order Pending'),
        body: OrderPendingViewBody(),
      ),
    );
  }
}
