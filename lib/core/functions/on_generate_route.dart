import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/pages/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/pages/dashboard_view.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
};
