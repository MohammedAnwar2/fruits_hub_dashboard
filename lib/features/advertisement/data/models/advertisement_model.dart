import 'package:fruits_hub_dashboard/core/functions/conver_colors.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';

class AdvertisementModel {
  final String id;
  String? imageUrl;
  final String titleEnglish;
  final String titleArabic;
  final num discount;
  final String backgroundBanner;
  final String pageRoute;

  AdvertisementModel({
    required this.id,
    this.imageUrl,
    required this.titleEnglish,
    required this.titleArabic,
    required this.discount,
    required this.backgroundBanner,
    required this.pageRoute,
  });

  factory AdvertisementModel.fromMap(Map<String, dynamic> map) {
    return AdvertisementModel(
      id: map['id'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      titleEnglish: map['titleEnglish'] ?? '',
      titleArabic: map['titleArabic'] ?? '',
      discount: map['discount']?.toDouble() ?? 0.0,
      backgroundBanner: map['backgroundBanner'] ?? '',
      pageRoute: map['pageRoute'] ?? '',
    );
  }

  factory AdvertisementModel.fromEntity(AdvertisementEntity entity) {
    return AdvertisementModel(
      id: entity.id,
      imageUrl: entity.imageUrl,
      titleEnglish: entity.titleEnglish,
      titleArabic: entity.titleArabic,
      discount: entity.discount,
      backgroundBanner: colorToString(entity.backgroundBanner),
      pageRoute: entity.pageRoute,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imageUrl': imageUrl,
      'titleEnglish': titleEnglish,
      'titleArabic': titleArabic,
      'discount': discount,
      'backgroundBanner': backgroundBanner,
      'pageRoute': pageRoute,
    };
  }

  AdvertisementEntity toEntity() {
    return AdvertisementEntity(
      id: id,
      imageUrl: imageUrl,
      titleEnglish: titleEnglish,
      titleArabic: titleArabic,
      discount: discount,
      backgroundBanner: stringToColor(backgroundBanner),
      pageRoute: pageRoute,
      imageFile: null,
    );
  }
}
