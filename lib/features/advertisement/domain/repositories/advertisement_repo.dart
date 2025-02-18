import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';

abstract class AdvertisementRepo {
  Future<Either<Failure, Unit>> addAdvertisement(AdvertisementEntity advertisementEntities);
  Future<Either<Failure, Unit>> deleteAdvertisement(String advertisementId);
  Future<Either<Failure, List<AdvertisementEntity>>> getAdvertisements();
  Future<Either<Failure, Unit>> updateAdvertisement(AdvertisementEntity advertisementEntities);
}