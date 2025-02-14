import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/repositories/orders_mangement_status_repo%20copy.dart';
part 'orders_mangement_status_state.dart';

class OrdersMangementStatusCubit extends Cubit<OrdersMangementStatusState> {
  final OrdersMangementStatusDashboardRepo ordersMangementStatusDashboardRepo;
  OrdersMangementStatusCubit(this.ordersMangementStatusDashboardRepo)
      : super(OrdersMangementStatusInitial());

  Future<void> nextStatus(String docId, int status) async {
    try {
      await ordersMangementStatusDashboardRepo.nextStatus(docId, status);
      emit(OrdersMangementStatusSuccess());
    } catch (e) {
      emit(OrdersMangementStatusError(message: e.toString()));
    }
  }

  Future<void> previousStatus(String docId, int status) async {
    try {
      await ordersMangementStatusDashboardRepo.previousStatus(docId, status);
      emit(OrdersMangementStatusSuccess());
    } catch (e) {
      emit(OrdersMangementStatusError(message: e.toString()));
    }
  }

  Future<void> deleteOrder(String docId) async {
    try {
      await ordersMangementStatusDashboardRepo.deleteOrder(docId);
      emit(OrdersMangementStatusSuccess());
    } catch (e) {
      emit(OrdersMangementStatusError(message: e.toString()));
    }
  }
}
