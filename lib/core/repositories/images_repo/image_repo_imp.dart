import 'dart:io';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/core/error/failures.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:fruits_hub_dashboard/core/utils/either_class.dart';

class ImageRepoImp implements ImageRepo {
  final StorageServices storageServices;

  ImageRepoImp({required this.storageServices});
  @override
  Future<Either<Failure, String>> uploadImage({required File file}) async {
    try {
      String imageUrl = await storageServices.uploadImage(
          file: file, storagePath: BackendendEndpoint.bucketName);
      return Either.right(imageUrl);
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.errorMessage));
    } catch (e) {
      return Either.left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, Unit>> deleteImage({required String imageUrl})async {
    try {
      await storageServices.deleteImage(imageUrl: imageUrl);
      return Either.right(Unit.instance);
    } on ServerException catch (e) {
      return Either.left(ServerFailure(e.errorMessage));
    }
  }
  
}
