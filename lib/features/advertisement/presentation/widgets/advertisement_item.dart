import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/custom_banner.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/custom_loaded_advertisement_image.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/custom_loading_advertisement_image.dart';

class AdvertisementItem extends StatelessWidget {
  const AdvertisementItem({super.key, required this.advertisement});
  final AdvertisementEntity advertisement;
  @override
  Widget build(BuildContext context) {
    bool isArabic = getLanguage();

    return AspectRatio(
      aspectRatio: 342 / 158,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        child: Stack(
          children: [
            if (advertisement.imageUrl != null)...{
            CustomLoadedAdvertisementImage(isArabic: isArabic, advertisement: advertisement),
            } else...{
            CustomLoadingAdvertisementImage(isArabic: isArabic),
            },
            CustomBanner( isArabic: isArabic,advertisement: advertisement),
          ],
        ),
      ),
    );
  }
  bool getLanguage() => false;
  // bool getLanguage() =>  SharedPref.getString(AppKey.localizationsDelegates) !='ar' ? false:true;
}







