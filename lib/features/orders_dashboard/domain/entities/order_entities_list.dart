import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';

class OrderEntitiesList  {
  List<OrderEntity> orders;
  OrderEntitiesList({required this.orders});
  addToList( List<OrderEntity> order) {
    orders.addAll(order);
  }

}