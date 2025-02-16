part of 'orders_dashboard_cubit.dart';

abstract class OrdersDashboardState {
  const OrdersDashboardState();
}

class OrdersDashboardInitial extends OrdersDashboardState {}

class OrdersDashboardLoading extends OrdersDashboardState {}


class OrdersDashboardSuccess extends OrdersDashboardState {
  final List<OrderEntity> orders;
  const OrdersDashboardSuccess({required this.orders});
}
class OrdersDashboardError extends OrdersDashboardState {
  final String message;
  const OrdersDashboardError({required this.message});
}
