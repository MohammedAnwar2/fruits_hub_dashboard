import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body.dart';

class AddProductsView extends StatelessWidget {
  static const String routeName = "addproductsview";
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Products'),
      body: AddProductsViewBody(),
    );
  }
}
