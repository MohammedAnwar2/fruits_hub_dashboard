import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/datasources/order_dashboard_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/models/order_model.dart';
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
  Future<Either<Failure, Unit>> nextStatus(OrderEntity  orderEntity, int status) async {
    try {
      OrderModel orderModel = OrderModel.fromEntity(orderEntity);
      await orderDashboardRemoteDatasource.nextStatus(orderModel, status);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('Failed to update status!'));
    }
  }

  @override
  Future<Either<Failure, Unit>> previousStatus(OrderEntity  orderEntity, int status) async {
    OrderModel orderModel = OrderModel.fromEntity(orderEntity);
    try {
      await orderDashboardRemoteDatasource.previousStatus(orderModel, status);
      return Either.right(Unit.instance);
    } catch (e) {
      return Either.left(ServerFailure('Failed to update status!'));
    }
  }
}
