import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/datasource/products_management_datasource.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/models/product_model.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

class ProductsRepoImp implements ProductsRepo {
  final ProductsManagementDatasource productsManagementDatasource;
  ProductsRepoImp({required this.productsManagementDatasource});
  @override
  Future<Either<Failure, Unit>> addProduct(
      ProductEntities productEntities) async {
    ProductModel productModel = ProductModel.fromEntity(productEntities);
    try {
      await productsManagementDatasource.addProduct(productModel);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to add product '));
    }
  }

  @override
  Future<Either<Failure, Unit>> deleteProduct(String productId) async {
    try {
      await productsManagementDatasource.deleteProduct(productId);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to delete product '));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntities>>> getProducts() async {
    try {
      List<ProductModel> products =
          await productsManagementDatasource.getProducts();
      List<ProductEntities> productEntities =
          products.map((e) => e.toEntity()).toList();
      return Either.right(productEntities);
    } catch (e) {
      return Either.left(ServerFailure('failed to get products '));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateProduct(
      ProductEntities productEntities) async {
    ProductModel productModel = ProductModel.fromEntity(productEntities);
    try {
      await productsManagementDatasource.updateProduct(productModel);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('failed to update product '));
    }
  }
}
