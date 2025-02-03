import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body_cunsumer.dart';

class AddProductsView extends StatelessWidget {
  static const String routeName = "addproductsview";
  const AddProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddProductsCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Add Products'),
        body: AddProductsViewBodyConsumer(),
      ),
    );
  }
}
