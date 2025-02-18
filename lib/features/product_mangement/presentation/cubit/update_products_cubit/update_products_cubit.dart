import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/update_products_usecase.dart';
part 'update_products_state.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  final UpdateProductsUsecase updateProductsUsecase;
  final ImageRepo imageRepo;
  UpdateProductsCubit(
      {required this.updateProductsUsecase, required this.imageRepo})
      : super(UpdateProductsInitial());

  Future<void> updateProduct({required ProductEntities productEntities}) async {
    if (productEntities.imageFile != null) {
      emit(UpdateProductsLoading());
      Either<Failure, String> result =
          await imageRepo.uploadImage(file: productEntities.imageFile!);
      result.fold((failure) {
        emit(UpdateProductsFailure(errorMessage: failure.errorMessage));
      }, (imageUrl) async {
        print('imageUrl === : $imageUrl');
        await imageRepo.deleteImage(imageUrl: productEntities.imageUrl!);
        productEntities.imageUrl = imageUrl;
        await _updateProductOnly(productEntities);
      });
    } else {
      emit(UpdateProductsLoading());
      await _updateProductOnly(productEntities);
    }
  }

  Future<void> _updateProductOnly(ProductEntities productEntities) async {
    Either<Failure, Unit> result =
        await updateProductsUsecase.call(productEntities);
    result.fold((failure) {
      emit(UpdateProductsFailure(errorMessage: failure.errorMessage));
    }, (success) {
      emit(UpdateProductsSuccess());
    });
  }
}
