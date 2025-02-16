import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/widgets/dashboard_view_body.dart';

class DashboardView extends StatelessWidget {
  static const String routeName = 'dashboardview';
  const DashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return DashboardViewBody();
  }
}
