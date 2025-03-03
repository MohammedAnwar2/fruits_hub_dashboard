import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:path/path.dart' as b;
import 'package:uuid/uuid.dart';

class FirebaseStorageServices extends StorageServices {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage(
      {required File file, required String storagePath}) async {
    try {
      // String fileName = b.basename(file.path);
      String fileName = getIt<Uuid>().v4();
      String extension = b.extension(file.path);
      String path = "$storagePath/$fileName$extension";
      final storageRef = firebaseStorage.ref().child(path);
      await storageRef.putFile(file);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw ServerException('Failed to upload image');
    }
  }
  
  @override
  Future<void> deleteImage({required String imageUrl})async {
    try {
      final storageRef = firebaseStorage.refFromURL(imageUrl);
      await storageRef.delete();
    } catch (e) {
      throw ServerException('Failed to delete image');
    }
  }
}
