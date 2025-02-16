import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

class ProductsRepoImp implements ProductsRepo {
  final DataBaseServices dataBaseServices;
  ProductsRepoImp({required this.dataBaseServices});
  @override
  Future<Either<Failure, Unit>> addProduct(
      ProductEntities productEntities) async {
    try {
      dataBaseServices.addData(
          path: BackendendEndpoint.addProducts,
          data: ProductModel.fromEntity(productEntities).toMap());
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to add product'));
    }
  }
}
