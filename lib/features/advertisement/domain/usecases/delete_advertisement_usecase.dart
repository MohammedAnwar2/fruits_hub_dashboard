import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/repositories/advertisement_repo.dart';

class DeleteAdvertisementUsecase extends Usecase<Unit,String >{
  final AdvertisementRepo advertisementRepo;
  DeleteAdvertisementUsecase({required this.advertisementRepo});
  @override
  Future<Either<Failure, Unit>> call(String  param) async{
    return await advertisementRepo.deleteAdvertisement(param);
  }
}