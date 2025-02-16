import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/products_management_view_body.dart';

class PoroductsManagementView extends StatelessWidget {
  const PoroductsManagementView({super.key});
  static const String routeName = "poroductsmanagementview";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products Management'),
      ),
      body: PoroductsManagementViewBody(),
    );
  }
}