import 'package:fruits_hub_dashboard/features/add_products/domain/entities/add_product_input_entity.dart';

class AddProductInputModel {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeature;
  final String imageUrl;
  AddProductInputModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeature,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCode': productCode,
      'productDescription': productDescription,
      'isFeature': isFeature,
      'imageUrl': imageUrl,
    };
  }

  factory AddProductInputModel.fromEntity(AddProductEntities addProducts) {
    return AddProductInputModel(
      productName: addProducts.productName,
      productPrice: addProducts.productPrice,
      productCode: addProducts.productCode,
      productDescription: addProducts.productDescription,
      isFeature: addProducts.isFeature,
      imageUrl: addProducts.imageUrl!,
    );
  }
}
