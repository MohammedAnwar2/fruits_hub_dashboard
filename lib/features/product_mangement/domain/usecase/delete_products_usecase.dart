import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';

class DeleteProductsUsecase extends Usecase<Unit,String > {
   final ProductsRepo productsRepo;
  DeleteProductsUsecase({required this.productsRepo});
  @override
  Future<Either<Failure, Unit>> call(String  param) async {
    return await productsRepo.deleteProduct(param);
  }
}
