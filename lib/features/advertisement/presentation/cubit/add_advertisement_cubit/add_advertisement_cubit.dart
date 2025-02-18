import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/add_advertisement_usecase.dart';
part 'add_advertisement_state.dart';

class AddAdvertisementCubit extends Cubit<AddAdvertisementState> {
  final AddAdvertisementUsecase addAdvertisementUsecase;
  final ImageRepo imageRepo;
  AddAdvertisementCubit({
    required this.addAdvertisementUsecase,
    required this.imageRepo,
  }) : super(AddAdvertisementInitial());

  Future<void> addAdvertisement(
      {required AdvertisementEntity advertisementEntities}) async {
    emit(AddAdvertisementLoading());
    final uploadImageResoult =
        await imageRepo.uploadImage(file: advertisementEntities.imageFile!);
    uploadImageResoult.fold((failure) {
      emit(AddAdvertisementFailure(message: failure.errorMessage));
    }, (imageUrl) async {
      advertisementEntities.imageUrl = imageUrl;
      final result = await addAdvertisementUsecase.call(advertisementEntities);
      result.fold((failure) {
        emit(AddAdvertisementFailure(message: failure.errorMessage));
      }, (r) {
        emit(AddAdvertisementSuccess());
      });
    });
  }
}
