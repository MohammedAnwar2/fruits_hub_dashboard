import 'dart:io';

class ProductEntities {
  final String productName;
  final num productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeature;
  final File imageFile;
  String? imageUrl;
  final int expirationMonths;
  final bool isOrganic;
  final num avgRating;
  final num ratingCount;
  final int numberOfCalories;
  final int unitAmount;
  final int sellingCount;

  ProductEntities({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeature,
    required this.imageFile,
    this.imageUrl,
    required this.expirationMonths,
    this.isOrganic = false,
    this.avgRating = 0,
    this.ratingCount = 0,
    required this.unitAmount,
    required this.numberOfCalories,
    this.sellingCount = 0,
  });
}
