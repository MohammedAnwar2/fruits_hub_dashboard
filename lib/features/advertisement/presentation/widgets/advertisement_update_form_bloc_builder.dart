import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/update_advertisement_cubit/update_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_update_form.dart';

class AdvertisementUpdateFormBlocBuilder extends StatelessWidget {
  const AdvertisementUpdateFormBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UpdateAdvertisementCubit, UpdateAdvertisementState>(
      listener: (context, state) {
        if (state is UpdateAdvertisementSuccess) {
          Navigator.pop(context, true);
          showEffectEventMessage(context, 'Advertisement Updated Successfully');
        }
        if (state is UpdateAdvertisementFailure) {
          Navigator.pop(context, false);
          showEffectEventMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is UpdateAdvertisementLoading,
          child: AdvertisementUpdateForm(),
        );
      },
    );
  }
}
