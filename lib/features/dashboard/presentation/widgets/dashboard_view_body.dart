import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/get_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_dashboard_view.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/pages/get_products_view.dart';

class DashboardViewBody extends StatelessWidget {
  const DashboardViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontal),
        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              text: "Products Management View",
              onPressed: () {
                Navigator.pushNamed(context,GetProductsView.routeName);
              },
            ),
            CustomButton(
              text: "Advertisement View",
              onPressed: () {
                Navigator.pushNamed(context,GetAdvertisementView.routeName);
              },
            ),
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
