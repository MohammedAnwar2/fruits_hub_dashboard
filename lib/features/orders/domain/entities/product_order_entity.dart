class ProductOrderEntity {
  final String productName;
  final num productPrice;
  final String productCode;
  final String imageUrl;
  final int quantity;

  ProductOrderEntity({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.imageUrl,
    required this.quantity,
  });
}
