import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/query_model.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/models/product_model.dart';

abstract class ProductsManagementDatasource {
  Future<void> addProduct(ProductModel productModel);
  Future<void> updateProduct(ProductModel productModel);
  Future<void> deleteProduct(String productId);
  Future<List<ProductModel>> getProducts();
}

class ProductsManagementDatasourceImp implements ProductsManagementDatasource {
  final DataBaseServices dataBaseServices;

  ProductsManagementDatasourceImp({required this.dataBaseServices});
  
  @override
  Future<void> addProduct(ProductModel productModel)async {
      await dataBaseServices.addData(path: BackendendEndpoint.addProducts, data: productModel.toMap());
  }
  
  @override
  Future<void> deleteProduct(String productId)async {
     QueryModel queryModel = QueryModel(
      where: [
        WhereFilter(
          field: BackendendEndpoint.productCodeProductField,
          isEqualTo: productId,
        ),
      ],
    );
    await dataBaseServices.delete(path: BackendendEndpoint.deleteProduct, query: queryModel.toMap());
  }
  
  @override
  Future<List<ProductModel>> getProducts() async{
    List<Map<String, dynamic>> data = await dataBaseServices.readData(path: BackendendEndpoint.getProducts);
    List<ProductModel> products = data.map((e) => ProductModel.fromJson(e)).toList();
    return products;
  }

  @override
  Future<void> updateProduct(ProductModel productModel) async{
    QueryModel queryModel = QueryModel(
      where: [
        WhereFilter(
          field: BackendendEndpoint.productCodeProductField,
          isEqualTo: productModel.productCode,
        ),
      ],
    );
    await dataBaseServices.update(path: BackendendEndpoint.updateProduct, query: queryModel.toMap(), data: productModel.toMap());
  }

}