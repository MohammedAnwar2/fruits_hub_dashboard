import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/entities/advertisement_list_entity.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/delete_advertisement_usecase.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/get_advertisement_usecase.dart';
part 'view_and_delete_advertisement_state.dart';

class ViewAndDeleteAdvertisementCubit
    extends Cubit<ViewAndDeleteAdvertisementState> {
  final GetAdvertisementUsecase viewAdvertisementUsecase;
  final DeleteAdvertisementUsecase deleteAdvertisementUsecase;
  final ImageRepo imageRepo;
  ViewAndDeleteAdvertisementCubit(
      {required this.viewAdvertisementUsecase,
      required this.deleteAdvertisementUsecase,
      required this.imageRepo})
      : super(ViewAndDeleteAdvertisementInitial());

  AdvertisementListEntity advertisementListEntity =
      AdvertisementListEntity(advertisements: []);
  Future<void> getAdvertisement() async {
    emit(ViewAdvertisementLoading());
    final result = await viewAdvertisementUsecase.call();
    result.fold((failure) {
      emit(ViewAndDeleteAdvertisementFailure(
          errorMessage: failure.errorMessage));
    }, (advertisement) {
      advertisementListEntity.clearList();
      advertisementListEntity.addAllToList(advertisement);
      emit(ViewAdvertisementSuccess(advertisements: advertisement));
    });
  }

  Future<void> deleteAdvertisement(AdvertisementEntity advertisementId) async {
    emit(DeleteAdvertisementLoading());
    final deleteImageResult =
        await imageRepo.deleteImage(imageUrl: advertisementId.imageUrl!);
    deleteImageResult.fold((failure) {
      emit(ViewAndDeleteAdvertisementFailure(
          errorMessage: failure.errorMessage));
    }, (success) async {
      final result = await deleteAdvertisementUsecase.call(advertisementId.id);
      result.fold((failure) {
        emit(ViewAndDeleteAdvertisementFailure(
            errorMessage: failure.errorMessage));
      }, (r) {
        advertisementListEntity.deleteFromList(advertisementId);
        emit(DeleteAdvertisementSuccess());
      });
    });
  }
}
