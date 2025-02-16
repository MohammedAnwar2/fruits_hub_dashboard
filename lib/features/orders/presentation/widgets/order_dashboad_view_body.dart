import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_button.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_archive_view.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/pages/order_pending_view.dart';

class OrderDashboardViewBody extends StatelessWidget {
  const OrderDashboardViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppConstants.horizontal),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            text: "Pending Orders",
            onPressed: () {
              Navigator.pushNamed(context, OrderPendingView.routeName);
            },
          ),
          SizedBox(height: 16),
          CustomButton(
            text: "Archived Orders",
            onPressed: () {
              Navigator.pushNamed(context, OrderArchiveView.routeName);
            },
          ),
        ],
      ),
    );
  }
}
