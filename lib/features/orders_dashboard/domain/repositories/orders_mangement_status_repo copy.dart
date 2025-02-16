import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';

abstract class OrdersMangementStatusDashboardRepo {
  Future<Either<Failure, Unit>> nextStatus(String docId, int status);

  Future<Either<Failure, Unit>> previousStatus(String docId, int status);

  Future<Either<Failure, Unit>> deleteOrder(String docId);
}
