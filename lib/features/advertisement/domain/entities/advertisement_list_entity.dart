import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';

class AdvertisementListEntity {
  final List<AdvertisementEntity> advertisements;
  const AdvertisementListEntity({required this.advertisements});

  addAllToList(List<AdvertisementEntity> advertisements) {
    this.advertisements.addAll(advertisements);
  }

  addToList(AdvertisementEntity advertisement) {
    advertisements.add(advertisement);
  }

  clearList() {
    advertisements.clear();
  }

  List<AdvertisementEntity> getAdvertisements() {
    return advertisements;
  }

  deleteFromList(AdvertisementEntity advertisement) {
    advertisements.remove(advertisement);
  }
}
