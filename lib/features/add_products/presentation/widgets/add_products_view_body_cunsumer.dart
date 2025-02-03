import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/utils/app_colors.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/widgets/add_products_view_body.dart';

class AddProductsViewBodyConsumer extends StatelessWidget {
  const AddProductsViewBodyConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductsCubit, AddProductsState>(
      listener: (context, state) {
        if (state is AddProductsSuccess) {
          showEffectEventMessage(context, 'Product Added Successfully');
          Navigator.pop(context);
        }
        if (state is AddProductsFailure) {
          showEffectEventMessage(
              context, state.errorMessage, AppColors.red, AppColors.white);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is AddProductsLoading,
          child: AddProductsViewBody(),
        );
      },
    );
  }
}
