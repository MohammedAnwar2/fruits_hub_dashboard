import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/models/product_model.dart';

abstract class ProductsManagementDatasource {
  Future<void> addProduct(ProductModel productModel);
  Future<void> updateProduct(ProductModel productModel);
  Future<void> deleteProduct(String productId);
  Future<void> getProducts();
}

class ProductsManagementDatasourceImp implements ProductsManagementDatasource {
  final DataBaseServices dataBaseServices;

  ProductsManagementDatasourceImp({required this.dataBaseServices});
  
  @override
  Future<void> addProduct(ProductModel productModel) {
    // TODO: implement addProduct
    throw UnimplementedError();
  }
  
  @override
  Future<void> deleteProduct(String productId) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }
  
  @override
  Future<void> getProducts() {
    // TODO: implement getProducts
    throw UnimplementedError();
  }
  
  @override
  Future<void> updateProduct(ProductModel productModel) {
    // TODO: implement updateProduct
    throw UnimplementedError();
  }

}