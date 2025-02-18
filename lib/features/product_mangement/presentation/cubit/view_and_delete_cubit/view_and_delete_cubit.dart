import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_list_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/delete_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/view_products_usecase.dart';
part 'view_and_delete_state.dart';

class ViewAndDeleteCubit extends Cubit<ViewAndDeleteState> {
  final DeleteProductsUsecase deleteProductsUsecase;
  final ViewProductsUsecase viewProductsUsecase;
  final ImageRepo imageRepo;
  ViewAndDeleteCubit(
      {required this.imageRepo,
      required this.deleteProductsUsecase,
      required this.viewProductsUsecase})
      : super(ViewAndDeleteInitial());

  ProductListEntity productListEntity = ProductListEntity(products: []);
  Future<void> deleteProduct({required ProductEntities productEntity}) async {
    emit(DeleteLoading());
    final deleteImageResult =
        await imageRepo.deleteImage(imageUrl: productEntity.imageUrl!);
    deleteImageResult.fold((failure) {
      emit(ViewAndDeleteFailure(errorMessage: failure.errorMessage));
    }, (success) async {
      Either<Failure, Unit> result =
          await deleteProductsUsecase.call(productEntity.productCode);
      result.fold((failure) {
        emit(ViewAndDeleteFailure(errorMessage: failure.errorMessage));
      }, (success) {
        productListEntity.removeFromList(productEntity.productCode);
        emit(DeleteSuccess());
      });
    });
  }

  Future<void> viewProducts() async {
    emit(ViewLoading());
    Either<Failure, List<ProductEntities>> result =
        await viewProductsUsecase.call();
    result.fold((failure) {
      emit(ViewAndDeleteFailure(errorMessage: failure.errorMessage));
    }, (success) {
      productListEntity.removeAllProducts();
      productListEntity.addAllProducts(success);
      emit(ViewLoaded(products: success));
    });
  }
}
