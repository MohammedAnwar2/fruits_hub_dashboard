import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/advertisement/data/models/advertisement_model.dart';

abstract class AdvertisementRemoteDatasource {
  Future<void> addAdvertisement(AdvertisementModel advertisementModel);
  Future<void> deleteAdvertisement(String advertisementId);
  Future<List<AdvertisementModel>> getAdvertisements();
  Future<void> updateAdvertisement(AdvertisementModel advertisementModel);
}

class AdvertisementRemoteDatasourceImp
    implements AdvertisementRemoteDatasource {
  final DataBaseServices dataBaseServices;

  AdvertisementRemoteDatasourceImp({required this.dataBaseServices});

  @override
  Future<void> addAdvertisement(AdvertisementModel advertisementModel) async {
    dataBaseServices.addData(
      path: BackendendEndpoint.addAdvertisements,
      docId: advertisementModel.id,
      data: advertisementModel.toMap(),
    );
  }

  @override
  Future<void> deleteAdvertisement(String advertisementId) async {
    dataBaseServices.delete(
      path: BackendendEndpoint.deleteAdvertisement,
      docId: advertisementId,
    );
  }

  @override
  Future<List<AdvertisementModel>> getAdvertisements() async {
    final response = await dataBaseServices.readData(
      path: BackendendEndpoint.getAdvertisements,
    );
    return (response as List)
        .map((e) => AdvertisementModel.fromMap(e))
        .toList();
  }

  @override
  Future<void> updateAdvertisement(
      AdvertisementModel advertisementModel) async {
    dataBaseServices.update(
      path: BackendendEndpoint.updateAdvertisement,
      docId: advertisementModel.id,
      data: advertisementModel.toMap(),
    );
  }
}
