import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/datasources/order_mangement_status_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/repositories/orders_mangement_status_repo%20copy.dart';

class OrdersMangementStatusDashboardRepoImp
    extends OrdersMangementStatusDashboardRepo {
  final OrderMangementStatusdRemoteDatasource orderDashboardRemoteDatasource;
  OrdersMangementStatusDashboardRepoImp({
    required this.orderDashboardRemoteDatasource,
  });
  @override
  @override
  Future<Either<Failure, Unit>> deleteOrder(String docId) async {
    try {
      await orderDashboardRemoteDatasource.deleteOrder(docId);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('Failed to delete order!'));
    }
  }

  @override
  Future<Either<Failure, Unit>> nextStatus(String docId, int status) async {
    try {
      await orderDashboardRemoteDatasource.nextStatus(docId, status);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('Failed to update status!'));
    }
  }

  @override
  Future<Either<Failure, Unit>> previousStatus(String docId, int status) async {
    try {
      await orderDashboardRemoteDatasource.previousStatus(docId, status);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('Failed to update status!'));
    }
  }
}
