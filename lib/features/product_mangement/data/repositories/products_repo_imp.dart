import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/datasource/products_management_datasource.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

class ProductsRepoImp implements ProductsRepo {
  final ProductsManagementDatasource productsManagementDatasource;
  // final DataBaseServices dataBaseServices;
  ProductsRepoImp({required this.productsManagementDatasource});
  @override
  Future<Either<Failure, Unit>> addProduct(
      ProductEntities productEntities) async {
    ProductModel productModel = ProductModel.fromEntity(productEntities);
    try {
      productsManagementDatasource.addProduct(productModel);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to add product'));
    }
  }
}
/*
productsManagementDatasource.addData(
          path: BackendendEndpoint.addProducts,
          data: ProductModel.fromEntity(productEntities).toMap())
 */