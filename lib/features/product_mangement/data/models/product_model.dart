import 'package:fruits_hub_dashboard/features/product_mangement/domain/entities/product_entity.dart';

class ProductModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeature;
  final String imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final num avgRating;
  final num ratingCount;
  final int unitAmount;
  final int numberOfCalories;
  final int sellingCount;

  ProductModel(
      {required this.productName,
      required this.productPrice,
      required this.productCode,
      required this.productDescription,
      required this.isFeature,
      required this.imageUrl,
      required this.expirationMonths,
      required this.isOrganic,
      required this.avgRating,
      required this.ratingCount,
      required this.unitAmount,
      required this.numberOfCalories,
      required this.sellingCount});

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCode': productCode,
      'productDescription': productDescription,
      'isFeature': isFeature,
      'imageUrl': imageUrl,
      'expirationMonths': expirationMonths,
      'isOrganic': isOrganic,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'unitAmount': unitAmount,
      'numberOfCalories': numberOfCalories,
      'sellingCount': sellingCount
    };
  }

  factory ProductModel.fromEntity(ProductEntities addProducts) {
    return ProductModel(
        productName: addProducts.productName,
        productPrice: addProducts.productPrice,
        productCode: addProducts.productCode,
        productDescription: addProducts.productDescription,
        isFeature: addProducts.isFeature,
        imageUrl: addProducts.imageUrl!,
        expirationMonths: addProducts.expirationMonths,
        isOrganic: addProducts.isOrganic,
        avgRating: addProducts.avgRating,
        ratingCount: addProducts.ratingCount,
        unitAmount: addProducts.unitAmount,
        numberOfCalories: addProducts.numberOfCalories,
        sellingCount: addProducts.sellingCount);
  }
}
