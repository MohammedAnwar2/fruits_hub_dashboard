import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/add_products_usecase.dart';
part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit( {required this.imageRepo, 
  required this.addProductsUsecase,
  })
      : super(AddProductsInitial());
  final ImageRepo imageRepo;
  final AddProductsUsecase addProductsUsecase;


  Future<void> addProduct({required ProductEntities addProductEntities}) async {
    emit(AddProductsLoading());
    Either<Failure, String> result =
        await imageRepo.uploadImage(file: addProductEntities.imageFile!);
    result.fold((failure) {
      emit(AddProductsFailure(errorMessage: failure.errorMessage));
    }, (imageUrl) async {
      addProductEntities.imageUrl = imageUrl;
      Either<Failure, Unit> result = await addProductsUsecase.call(addProductEntities);
      result.fold((failure) {
        emit(AddProductsFailure(errorMessage: failure.errorMessage));
      }, (success) {
        emit(AddProductsSuccess());
      });
    });
  }
}
