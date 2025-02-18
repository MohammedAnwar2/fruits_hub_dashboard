import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/repositories/advertisement_repo.dart';

class UpdateAdvertisementUsecase extends Usecase<Unit,AdvertisementEntity>{
  final AdvertisementRepo advertisementRepo;
  UpdateAdvertisementUsecase({required this.advertisementRepo});
  @override
  Future<Either<Failure, Unit>> call(AdvertisementEntity param) async{
    return await advertisementRepo.updateAdvertisement(param);
  }
}