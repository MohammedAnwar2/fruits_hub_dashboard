import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/repositories/advertisement_repo.dart';

class GetAdvertisementUsecase extends UsecaseNoParam<List<AdvertisementEntity>>{
  final AdvertisementRepo advertisementRepo;
  GetAdvertisementUsecase({required this.advertisementRepo});
  @override
  Future<Either<Failure, List<AdvertisementEntity>>> call() async{
    return await advertisementRepo.getAdvertisements();
  }
}