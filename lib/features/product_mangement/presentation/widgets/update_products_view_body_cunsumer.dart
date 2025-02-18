import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/update_products_cubit/update_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/widgets/update_products_view_body.dart';

class UpdateProductsViewBodyConsumer extends StatelessWidget {
  const UpdateProductsViewBodyConsumer({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateProductsCubit, UpdateProductsState>(
      listener: (context, state) {
        if (state is UpdateProductsSuccess) {
          showEffectEventMessage(context, 'Product Updated Successfully');
          Navigator.pop(context, true);
        }
        if (state is UpdateProductsFailure) {
          showEffectEventMessage(
              context, state.errorMessage, AppColors.red, AppColors.white);
          Navigator.pop(context, false);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is UpdateProductsLoading,
          child: UpdateProductsViewBody(),
        );
      },
    );
  }
}
