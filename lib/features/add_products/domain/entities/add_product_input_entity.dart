import 'dart:io';

class AddProductEntities {
  final String productName;
  final String productPrice;
  final String productCode;
  final String productDescription;
  final bool isFeature;
  final File imageFile;
  String? imageUrl;
  AddProductEntities({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.productDescription,
    required this.isFeature,
    required this.imageFile,
    this.imageUrl,
  });
}
