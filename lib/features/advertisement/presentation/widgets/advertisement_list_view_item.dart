import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
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
        return  AdvertisementItem(advertisement: advertisements[index]);
        // return  AdvertisementItem(advertisement: advertisements[index]);
      },
    );
  }
}