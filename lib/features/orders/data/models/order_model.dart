import 'dart:developer';

import 'package:fruits_hub_dashboard/features/orders/data/models/product_order_model.dart';
import 'package:fruits_hub_dashboard/features/orders/data/models/shipping_address_model.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders/domain/entities/product_order_entity.dart';

class OrderModel {
  final String uid;
  final String orderid;
  final num totalPrice;
  final bool payWithCash;
  final int status;
  final List<ProductOrderModel> productOrderModel;
  final ShippingAddressModel shippingAddressModel;
  final DateTime orderDate;
  final List<String> timeline;

  OrderModel(
      {required this.uid,
      required this.orderid,
      required this.totalPrice,
      required this.payWithCash,
      required this.productOrderModel,
      required this.shippingAddressModel,
      required this.status,
      required this.orderDate,
      required this.timeline});

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
      orderid: json['orderid'],
      timeline: json['timelines'].cast<String>(),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'orderid': orderid,
      'totalPrice': totalPrice,
      'payWithCash': payWithCash,
      'orderDate': orderDate.toIso8601String(),
      'status': status,
      'productOrderModel': productOrderModel
          .map((productOrderModel) => productOrderModel.toJson())
          .toList(),
      'shippingAddressModel': shippingAddressModel.toJson(),
      'timelines': timeline
    };
  }

  factory OrderModel.fromEntity(OrderEntity orderEntity) {
    return OrderModel(
      uid: orderEntity.uid,
      totalPrice: orderEntity.totalPrice,
      payWithCash: orderEntity.payWithCash,
      productOrderModel: orderEntity.productOrderEntity
          .map<ProductOrderModel>((productOrderEntity) =>
              ProductOrderModel.fromEntity(productOrderEntity))
          .toList(),
      shippingAddressModel:
          ShippingAddressModel.fromEntity(orderEntity.shippingAddressEntity),
      status: orderEntity.status,
      orderDate: orderEntity.orderDate,
      orderid: orderEntity.orderid,
      timeline: orderEntity.timeline,
    );
  }

  OrderEntity toEntity() {
    return OrderEntity(
      orderid: orderid,
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
      timeline: timeline,
    );
  }
}
