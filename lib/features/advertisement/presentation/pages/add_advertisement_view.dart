import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/add_advertisement_view_body.dart';

class AddAdvertisementView extends StatelessWidget {
  const AddAdvertisementView({super.key});
  static const String routeName = 'add_advertisement_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddAdvertisementCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Add Advertisement'),
        body: AddAdvertisementViewBody(),
      ),
    );
  }
}