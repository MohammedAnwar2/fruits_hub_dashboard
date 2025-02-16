import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';

class AddProductsUsecase extends Usecase<Unit,ProductEntities > {
   final ProductsRepo productsRepo;
  AddProductsUsecase({required this.productsRepo});
  @override
  Future<Either<Failure, Unit>> call(ProductEntities  param) async {
    return productsRepo.addProduct(param);
  }
}
