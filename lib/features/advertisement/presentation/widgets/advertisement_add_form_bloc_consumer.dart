import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/utils/custom_model_progress_indecator.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_add_form.dart';

class AdvertisementAddFormBlocBuilder extends StatelessWidget {
  const AdvertisementAddFormBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddAdvertisementCubit, AddAdvertisementState>(
      listener: (context, state) {
        if (state is AddAdvertisementSuccess) {
          Navigator.pop(context, true);
          showEffectEventMessage(context, 'Advertisement Added Successfully');
        }
        if (state is AddAdvertisementFailure) {
          Navigator.pop(context, false);
          showEffectEventMessage(context, 'Advertisement Added Failed');
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          inAsyncCall: state is AddAdvertisementLoading,
          child: AdvertisementAddForm(),
        );
      },
    );
  }
}