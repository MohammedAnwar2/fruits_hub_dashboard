import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/product_order_entity.dart';

class ProductOrderModel {
  final String productName;
  final num productPrice;
  final String productCode;
  final String imageUrl;
  final int quantity;

  ProductOrderModel({
    required this.productName,
    required this.productPrice,
    required this.productCode,
    required this.imageUrl,
    required this.quantity,
  });

  factory ProductOrderModel.fromJson(Map<String, dynamic> json) {
    return ProductOrderModel(
      productName: json['productName'],
      productPrice: json['productPrice'],
      productCode: json['productCode'],
      imageUrl: json['imageUrl'],
      quantity: json['quantity'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productCode': productCode,
      'imageUrl': imageUrl,
      'quantity': quantity,
    };
  }

  ProductOrderEntity toEntity() {
    return ProductOrderEntity(
      productName: productName,
      productPrice: productPrice,
      productCode: productCode,
      imageUrl: imageUrl,
      quantity: quantity,
    );
  }
}
