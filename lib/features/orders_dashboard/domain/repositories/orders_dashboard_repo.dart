import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/domain/entities/order_entity.dart';

abstract class OrdersDashboardRepo {
  Future<Either<Failure, List<OrderEntity>>> getPendingOrders();
  Future<Either<Failure, List<OrderEntity>>> getArchivedOrders();
}
