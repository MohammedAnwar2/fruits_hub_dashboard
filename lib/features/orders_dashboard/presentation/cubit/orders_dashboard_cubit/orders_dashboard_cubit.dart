import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_list_items_entities.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/repositories/orders_dashboard_repo.dart';
part 'orders_dashboard_state.dart';

class OrdersDashboardCubit extends Cubit<OrdersDashboardState> {
  final OrdersDashboardRepo ordersDashboardRepo;
  OrdersDashboardCubit({required this.ordersDashboardRepo})
      : super(OrdersDashboardInitial());
  final OrderListItemsEntities ordersList = OrderListItemsEntities(orders: []);
  Future<void> getPendingOrders() async {
    emit(OrdersDashboardLoading());
    final result = await ordersDashboardRepo.getPendingOrders();
    result.fold(
      (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
      (orders) {
        ordersList.addAllToList(orders);
        emit(OrdersDashboardSuccess(orders: orders));
      } 
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

    Future<void> nextStatus(OrderEntity orderModel, int status) async {
      emit(OrdersDashboardLoading());
      final result = await ordersDashboardRepo.nextStatus(orderModel, status);
      result.fold(
        (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
        (unit) async{
          orderModel.increamentStatus();
          ordersList.replaceInList(orderModel);
          emit(OrdersDashboardSuccess(orders: ordersList.orders));
        } 
      );
  }

  Future<void> previousStatus(OrderEntity orderModel, int status) async {
    emit(OrdersDashboardLoading());
    final result = await ordersDashboardRepo.previousStatus(orderModel, status);
    result.fold(
      (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
      (unit) {
          orderModel.decreamentStatus();
          ordersList.replaceInList(orderModel);
          emit(OrdersDashboardSuccess(orders: ordersList.orders));
      } 
    );
  }

  Future<void> deleteOrder(String docId) async {
    emit(OrdersDashboardLoading());
    final result = await ordersDashboardRepo.deleteOrder(docId);
    result.fold(
      (failure) => emit(OrdersDashboardError(message: failure.errorMessage)),
      (unit) => emit(OrdersDashboardSuccess(orders: ordersList.orders)),
    );
  }
}
