import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/advertisement/data/datasources/advertisement_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/advertisement/data/models/advertisement_model.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/repositories/advertisement_repo.dart';

class AdvertisementRepoImp implements AdvertisementRepo {
  final AdvertisementRemoteDatasource advertisementsManagementDatasource;

  AdvertisementRepoImp({required this.advertisementsManagementDatasource});
  @override
  Future<Either<Failure, Unit>> addAdvertisement(
      AdvertisementEntity advertisementEntities) async {
    AdvertisementModel advertisementModel =
        AdvertisementModel.fromEntity(advertisementEntities);
    try {
      await advertisementsManagementDatasource
          .addAdvertisement(advertisementModel);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to add advertisement '));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteAdvertisement(
      String advertisementId) async {
    try {
      await advertisementsManagementDatasource
          .deleteAdvertisement(advertisementId);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to delete advertisement '));
    }
  }

  @override
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements() async {
    try {
      List<AdvertisementModel> advertisements =
          await advertisementsManagementDatasource.getAdvertisements();
      List<AdvertisementEntity> advertisementEntities =
          advertisements.map((e) => e.toEntity()).toList();
      return Either.right(advertisementEntities);
    } catch (e) {
      return Either.left(ServerFailure('failed to get advertisements '));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateAdvertisement(
      AdvertisementEntity advertisementEntities) async {
    AdvertisementModel advertisementModel =
        AdvertisementModel.fromEntity(advertisementEntities);
    try {
      await advertisementsManagementDatasource
          .updateAdvertisement(advertisementModel);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to update advertisement '));
    }
  }
}
