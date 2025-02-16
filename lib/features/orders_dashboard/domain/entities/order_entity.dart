import 'package:equatable/equatable.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/product_order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/shipping_address_entity.dart';

class OrderEntity extends Equatable {
  final String uid;
  final num totalPrice;
  final bool payWithCash;
   int status;
  final List<ProductOrderEntity> productOrderEntity;
  final ShippingAddressEntity shippingAddressEntity;
  final DateTime orderDate;

  OrderEntity({
    required this.uid,
    required this.totalPrice,
    required this.payWithCash,
    required this.productOrderEntity,
    required this.shippingAddressEntity,
    required this.status,
    required this.orderDate,
  });

  increamentStatus() {
     status = status + 1;
     return status;
  }

  decreamentStatus() {
    status = status - 1;
    return status;
  }
  
  @override
  List<Object?> get props => [uid];

}
