import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, Unit>> addProduct(ProductEntities productEntities);

  Future<Either<Failure, List<ProductEntities>>> getProducts();

  Future<Either<Failure, Unit>> updateProduct(ProductEntities productEntities);

  Future<Either<Failure, Unit>> deleteProduct(String productId);

}
