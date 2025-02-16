import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';

class OrderListItemsEntities  {
  List<OrderEntity> orders;
  OrderListItemsEntities({required this.orders});
  addAllToList( List<OrderEntity> order) {
    orders.addAll(order);
  }
  replaceInList(OrderEntity orderEntity) {
    if(orderEntity.status==4 ){
      removeOrder(orderEntity.orderid);
      // orders.removeWhere((element) => element.orderid == orderEntity.orderid);
    }else {
      orders = orders.map((e) => e.orderid == orderEntity.orderid ? orderEntity : e).toList();
    }
  }
  removeOrder(String orderId) {
    orders.removeWhere((element) => element.orderid == orderId);
  }
}