import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/view_and_delete_advertisement_cubit/view_and_delete_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/add_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_view_body.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_floating_action_button.dart';

class GetAdvertisementView extends StatelessWidget {
  const GetAdvertisementView({super.key});

  static const String routeName = 'get_advertisement_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ViewAndDeleteAdvertisementCubit>()..getAdvertisement(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'All Advertisement'),
        floatingActionButton: CustomFloatingActionButton(
          onPressed: (context) async {
            final result = await Navigator.pushNamed(
                context, AddAdvertisementView.routeName);
            if (result == true) {
              context
                  .read<ViewAndDeleteAdvertisementCubit>()
                  .getAdvertisement();
            }
          },
        ),
        body: AdvertisementViewBody(),
      ),
    );
  }
}

