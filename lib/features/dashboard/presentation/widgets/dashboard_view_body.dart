import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/add_products_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/poroducts_management_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontal),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Products Management",
              onPressed: () {
                Navigator.pushNamed(context, PoroductsManagementView.routeName);
              },
            ),
            SizedBox(height: 16),
            CustomButton(
              text: "Orders View",
              onPressed: () {
                Navigator.pushNamed(context, OrderDashboardView.routeName);
              },
            ),
          ],
        ),
      ),
    );
  }
}
