import 'dart:io';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';

abstract class ImageRepo {
  Future<Either<Failure, String>> uploadImage({required File file});
}
