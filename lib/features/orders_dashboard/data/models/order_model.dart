import 'package:fruits_hub_dashboard/features/orders_dashboard/data/models/product_order_model.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/product_order_entity.dart';

class OrderModel {
  final String uid;
  final num totalPrice;
  final bool payWithCash;
  final int status;
  final List<ProductOrderModel> productOrderModel;
  final ShippingAddressModel shippingAddressModel;
  final DateTime orderDate;

  OrderModel({
    required this.uid,
    required this.totalPrice,
    required this.payWithCash,
    required this.productOrderModel,
    required this.shippingAddressModel,
    required this.status,
    required this.orderDate,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      uid: json['uid'],
      totalPrice: json['totalPrice'],
      payWithCash: json['payWithCash'],
      productOrderModel: json['productOrderModel']
          .map<ProductOrderModel>((productOrderModel) =>
              ProductOrderModel.fromJson(productOrderModel))
          .toList(),
      shippingAddressModel:
          ShippingAddressModel.fromJson(json['shippingAddressModel']),
      status: json['status'],
      orderDate: DateTime.parse(json['orderDate']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'totalPrice': totalPrice,
      'payWithCash': payWithCash,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
      'productOrderModel': productOrderModel
          .map((productOrderModel) => productOrderModel.toJson())
          .toList(),
      'shippingAddressModel': shippingAddressModel.toJson(),
    };
  }

  OrderEntity toEntity() {
    return OrderEntity(
      uid: uid,
      totalPrice: totalPrice,
      payWithCash: payWithCash,
      productOrderEntity: productOrderModel
          .map<ProductOrderEntity>(
              (productOrderModel) => productOrderModel.toEntity())
          .toList(),
      shippingAddressEntity: shippingAddressModel.toEntity(),
      status: status,
      orderDate: orderDate,
    );
  }
}
