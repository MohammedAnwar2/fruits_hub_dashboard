import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

class ProductListEntity {
  final List<ProductEntities> products;

  ProductListEntity({required this.products});

  addAllProducts(List<ProductEntities> products) {
    this.products.addAll(products);
  }
  
  removeFromList(String productCode) {
    products.removeWhere((element) => element.productCode == productCode);
  }

  removeAllProducts() {
    products.clear();
  }
}