import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/add_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/get_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/update_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/pages/dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_archive_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_pending_view.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/get_products_view.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/update_products_view.dart';

Route<dynamic>? Function(RouteSettings)? onGenerateRoute = (settings) {
  switch (settings.name) {
    case DashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const DashboardView());
    case AddProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const AddProductsView());
    case OrderDashboardView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderDashboardView());
    case OrderPendingView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderPendingView());
    case OrderArchiveView.routeName:
      return MaterialPageRoute(builder: (_) => const OrderArchiveView());
    case GetProductsView.routeName:
      return MaterialPageRoute(builder: (_) => const GetProductsView());
    case UpdateProductsView.routeName:
      return MaterialPageRoute(builder: (_) =>  UpdateProductsView(
        productEntities: settings.arguments as ProductEntities,
      ));
    case GetAdvertisementView.routeName:
      return MaterialPageRoute(builder: (_) => const GetAdvertisementView());
    case AddAdvertisementView.routeName:
      return MaterialPageRoute(builder: (_) => const AddAdvertisementView());
    case UpdateAdvertisementView.routeName:
      return MaterialPageRoute(builder: (_) => const UpdateAdvertisementView());
    default:
      return MaterialPageRoute(builder: (_) => const Scaffold());
  }
};
