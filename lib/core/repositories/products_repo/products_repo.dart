import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

abstract class ProductsRepo {
  Future<Either<Failure, Unit>> addProduct(AddProductEntities productEntities);
}
