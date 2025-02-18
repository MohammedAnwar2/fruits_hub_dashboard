import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/update_advertisement_usecase.dart';
part 'update_advertisement_state.dart';

class UpdateAdvertisementCubit extends Cubit<UpdateAdvertisementState> {
  final UpdateAdvertisementUsecase updateAdvertisementUsecase;
  final ImageRepo imageRepo;
  UpdateAdvertisementCubit({
    required this.updateAdvertisementUsecase,
    required this.imageRepo,
  }) : super(UpdateAdvertisementInitial());

  Future<void> updateAdvertisement(
      {required AdvertisementEntity advertisementEntities}) async {
    emit(UpdateAdvertisementLoading());
    if (advertisementEntities.imageFile != null) {
      final uploadImageResoult =
          await imageRepo.uploadImage(file: advertisementEntities.imageFile!);
      uploadImageResoult.fold((failure) {
        emit(UpdateAdvertisementFailure(errorMessage: failure.errorMessage));
      }, (imageUrl) async {
        advertisementEntities.imageUrl = imageUrl;
        await _updateOnlyInformation(advertisementEntities);
      });
    } else {
      await _updateOnlyInformation(advertisementEntities);}
  }

  Future<void> _updateOnlyInformation(
      AdvertisementEntity advertisementEntities) async {
    final result = await updateAdvertisementUsecase.call(advertisementEntities);
    result.fold((failure) {
      emit(UpdateAdvertisementFailure(errorMessage: failure.errorMessage));
    }, (r) {
      emit(UpdateAdvertisementSuccess());
    });
  }
}
