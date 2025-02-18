import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/functions/show_evect_event_message.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/view_and_delete_advertisement_cubit/view_and_delete_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/pages/update_advertisement_view.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_item.dart';

class AdvertisementListViewItem extends StatelessWidget {
  const AdvertisementListViewItem({super.key, required this.advertisements});
  final List<AdvertisementEntity> advertisements;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: advertisements.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildAdvertisementItem(context,index);
      },
    );
  }

  Column _buildAdvertisementItem(BuildContext context,int index) {
    return Column(
        spacing: 10,
        children: [
          IconButton(onPressed: (){
            context.read<ViewAndDeleteAdvertisementCubit>().deleteAdvertisement(advertisements[index]);
          }, icon: Icon(Icons.delete)),
          GestureDetector(
              onTap: () async {
                await _navigateToUpdateAdvertisement(context, index);
              },
              child: AdvertisementItem(advertisement: advertisements[index])),
        ],
      );
  }

  Future<void> _navigateToUpdateAdvertisement(BuildContext context, int index) async {
    final result = await Navigator.pushNamed(
      context,
      UpdateAdvertisementView.routeName,
      arguments: advertisements[index],
    );
    if (result == true) {
      context
          .read<ViewAndDeleteAdvertisementCubit>()
          .getAdvertisement();
    } else if (result == false) {
      showEffectEventMessage(
          context, 'No changes were made to the advertisement');
    }
  }
}
