import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';

class CustomLoadedAdvertisementImage extends StatelessWidget {
  const CustomLoadedAdvertisementImage({
    super.key,
    required this.isArabic,
    required this.advertisement,
  });

  final bool isArabic;
  final AdvertisementEntity advertisement;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Positioned(
      top: 0,
      bottom: 0,
      left: isArabic ? 0 : width * .38,
      right: isArabic ? width * .38 : 0,
      child: Image.network(advertisement.imageUrl!, fit: BoxFit.fill),
    );
  }
}