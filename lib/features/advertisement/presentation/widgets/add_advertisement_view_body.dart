import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_add_form_bloc_consumer.dart';

class AddAdvertisementViewBody extends StatelessWidget {
  const AddAdvertisementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AdvertisementAddFormBlocBuilder();
  }
}