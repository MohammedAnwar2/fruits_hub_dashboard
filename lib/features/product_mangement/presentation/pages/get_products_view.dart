import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/view_and_delete_cubit/view_and_delete_cubit.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_floating_action_button.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/get_products_view.dart';
import 'add_products_view.dart';

class GetProductsView extends StatelessWidget {
  const GetProductsView({super.key});

  static const String routeName = 'getproductsview';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewAndDeleteCubit>()..viewProducts(),
      child: Scaffold(
        floatingActionButton: CustomFloatingActionButton(
          onPressed: (context) async {
            final result =
                await Navigator.pushNamed(context, AddProductsView.routeName);
            if (result == true) {
              context.read<ViewAndDeleteCubit>().viewProducts();
            }
          },
        ),
        appBar: AppBar(
          title: const Text('All Products'),
        ),
        body: const GetProductsViewBody(),
      ),
    );
  }
}
