import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/repositories/orders_dashboard_repo.dart';

part 'orders_dashboard_state.dart';

class OrdersDashboardCubit extends Cubit<OrdersDashboardState> {
  final OrdersDashboardRepo ordersDashboardRepo;
  OrdersDashboardCubit({required this.ordersDashboardRepo})
      : super(OrdersDashboardInitial());
  Future<void> getPendingOrders() async {
    emit(OrdersDashboardLoading());
    final result = await ordersDashboardRepo.getPendingOrders();
    result.fold(
      (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
      (orders) => emit(OrdersDashboardSuccess(orders: orders)),
    );
  }

  Future<void> getArchivedOrders() async {
    emit(OrdersDashboardLoading());
    final result = await ordersDashboardRepo.getArchivedOrders();
    result.fold(
      (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
      (orders) => emit(OrdersDashboardSuccess(orders: orders)),
    );
  }
}
