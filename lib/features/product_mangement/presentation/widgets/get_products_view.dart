import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/dummy/products_dummy_data.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/view_and_delete_cubit/view_and_delete_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/product_item_list_view.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GetProductsViewBody extends StatelessWidget {
  const GetProductsViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewAndDeleteCubit = context.read<ViewAndDeleteCubit>();
    final products = viewAndDeleteCubit.productListEntity.products;
    return BlocConsumer<ViewAndDeleteCubit, ViewAndDeleteState>(
      listener: (context, state) {
        if (state is DeleteSuccess) {
          showEffectEventMessage(context, 'Product deleted successfully');
        }
      },
      builder: (context, state) {
        switch (state) {
          case DeleteLoading():
            return CustomModalProgressHUD(
                inAsyncCall: true,
                child: ProductItemListView(products: products));
          case DeleteSuccess():
            if (products.isEmpty) {
              return const Center(
                child: Text('No products available'),
              );
            } else {
              return ProductItemListView(products: products);
            }
          case ViewAndDeleteInitial():
            return SizedBox();
          case ViewLoading():
            return Skeletonizer(
                enabled: true,
                child: ProductItemListView(products: productsListDummyData));
          case ViewAndDeleteFailure():
            return const Center(
              child: Text('Failed to load products'),
            );
          case ViewLoaded():
            if (state.products.isEmpty) {
              return const Center(
                child: Text('No products available'),
              );
            } else {
              return ProductItemListView(products: state.products);
            }
        }
      },
    );
  }
}
