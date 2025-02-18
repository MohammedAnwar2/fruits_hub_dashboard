import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/core/utils/use_case.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';

class ViewProductsUsecase extends UsecaseNoParam<List<ProductEntities>> {
   final ProductsRepo productsRepo;
  ViewProductsUsecase({required this.productsRepo});
  @override
  Future<Either<Failure, List<ProductEntities>>> call() async {
    return await productsRepo.getProducts();
  }
}