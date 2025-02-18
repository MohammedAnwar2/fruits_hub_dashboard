import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_list_view_bloc_consumer.dart';

class AdvertisementViewBody extends StatelessWidget {
  const AdvertisementViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: AdvertisementListViewBlocConsumer(),
    );
  }
}
