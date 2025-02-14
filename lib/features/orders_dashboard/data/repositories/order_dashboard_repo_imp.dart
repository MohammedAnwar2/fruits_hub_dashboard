import 'dart:developer';

import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/datasources/order_dashboard_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/repositories/orders_dashboard_repo.dart';

class OrderDashboardRepoImp extends OrdersDashboardRepo {
  final OrderDashboardRemoteDatasource orderDashboardRemoteDatasource;
  OrderDashboardRepoImp({
    required this.orderDashboardRemoteDatasource,
  });
  @override
  Future<Either<Failure, List<OrderEntity>>> getPendingOrders() async {
    try {
      final data = await orderDashboardRemoteDatasource.getPendingOrders();
      List<OrderEntity> orders = data.map((e) => e.toEntity()).toList();
      return Either.right(orders);
    } catch (e) {
      // log(e.toString());
      // return Either.left(ServerFailure(e.toString()));
      return Either.left(ServerFailure('Failed to get orders!'));
    }
  }

  @override
  Future<Either<Failure, List<OrderEntity>>> getArchivedOrders() async {
    try {
      final data = await orderDashboardRemoteDatasource.getArchivedOrders();
      List<OrderEntity> orders = data.map((e) => e.toEntity()).toList();
      return Either.right(orders);
    } catch (e) {
      log(e.toString());
      // return Either.left(ServerFailure(e.toString()));
      return Either.left(ServerFailure('Failed to get orders!'));
    }
  }
}
