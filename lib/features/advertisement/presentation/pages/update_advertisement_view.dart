import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/update_advertisement_cubit/update_advertisement_cubit.dart';

class UpdateAdvertisementView extends StatelessWidget {
  const UpdateAdvertisementView({super.key});
  static const String routeName = 'update_advertisement_view';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<UpdateAdvertisementCubit>(),
      child: Scaffold(
        appBar: CustomAppBar(title: 'Update Advertisement'),
        body: UpdateAdvertisementViewBody(),
      ),
    );
  }
}

class UpdateAdvertisementViewBody extends StatelessWidget {
  const UpdateAdvertisementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}