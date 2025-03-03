import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/utils/entity_provider.dart';
import 'package:fruits_hub_dashboard/core/widgets/custom_appbar.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/update_advertisement_cubit/update_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/update_advertisement_view_body.dart';

class UpdateAdvertisementView extends StatefulWidget {
  const UpdateAdvertisementView({super.key, required this.advertisement});
  static const String routeName = 'update_advertisement_view';
  final AdvertisementEntity advertisement;

  @override
  State<UpdateAdvertisementView> createState() => _UpdateAdvertisementViewState();
}

class _UpdateAdvertisementViewState extends State<UpdateAdvertisementView> {

  @override
  void dispose() {
    EntityProvider.dispose<AdvertisementEntity>();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return EntityProvider.create<AdvertisementEntity>(
      entity: widget.advertisement,
      child: BlocProvider(
        create: (context) => getIt<UpdateAdvertisementCubit>(),
        child: Scaffold(
            appBar: CustomAppBar(title: 'Update Advertisement'),
            body: UpdateAdvertisementViewBody(),
          ),
      ),
    );
  }
}

