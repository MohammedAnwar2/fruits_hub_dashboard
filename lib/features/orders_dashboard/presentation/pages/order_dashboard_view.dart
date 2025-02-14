import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/presentation/widgets/order_dashboad_view_body.dart';

class OrderDashboardView extends StatelessWidget {
  const OrderDashboardView({super.key});
  static const routeName = 'order_dashboard_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Order Dashboard'),
      body: OrderDashboardViewBody(),
    );
  }
}
