import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/utils/entity_provider.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/update_products_cubit/update_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/update_products_view_body_cunsumer.dart';

class UpdateProductsView extends StatefulWidget {
  static const String routeName = "updateproductsview";
  const UpdateProductsView({super.key, required this.productEntities});
  final ProductEntities productEntities;

  @override
  State<UpdateProductsView> createState() => _UpdateProductsViewState();
}

class _UpdateProductsViewState extends State<UpdateProductsView> {
  @override
   void dispose() {
    EntityProvider.dispose<ProductEntities>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    
    return EntityProvider.create<ProductEntities>(
      entity: widget.productEntities,
      child: BlocProvider(
        create: (context) => getIt<UpdateProductsCubit>(),
        child: Scaffold(
          appBar: CustomAppBar(title: 'Update Products'),
          body: UpdateProductsViewBodyConsumer(),
        ),
      ),
    );
  }
}
