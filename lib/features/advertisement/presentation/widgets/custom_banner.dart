import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/utils/app_text_style.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/widgets/advertisement_item_bottom.dart';

import 'banner_clipper.dart';

class CustomBanner extends StatelessWidget {
  // final double width;
  final bool isArabic;
  final AdvertisementEntity advertisement;

  const CustomBanner(
      {super.key,
      // required this.width,
      required this.isArabic,
      required this.advertisement});

  @override
  Widget build(BuildContext context) {
double width = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: BannerClipper(isArabic: isArabic),
      child: Container(
        width: width * .5,
        padding: EdgeInsets.all(16),
        color: advertisement.backgroundBanner, // لون الخلفية
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getTitle,
                    style: AppTextStyle.regular13.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'خصم ${advertisement.discount}%',
                    style: AppTextStyle.bold19.copyWith(
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  AdvertisementItemButtom(onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get getTitle => isArabic ? advertisement.titleArabic : advertisement.titleEnglish;
}