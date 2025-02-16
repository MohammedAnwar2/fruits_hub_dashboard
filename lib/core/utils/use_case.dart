import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';

abstract class Usecase<T,Param>{
  Future<Either<Failure, T>> call(Param param);
}
abstract class UsecaseNoParam<T>{
  Future<Either<Failure, T>> call();
}