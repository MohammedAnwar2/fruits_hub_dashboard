import 'dart:io';

class ProductEntities {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeature;
  final File imageFile;
  final String? imageUrl;
  ProductEntities({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeature,
    required this.imageFile,
    this.imageUrl,
  });
}
