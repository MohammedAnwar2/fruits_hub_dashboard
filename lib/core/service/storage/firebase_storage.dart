import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:path/path.dart' as b;

class FirebaseStorageServices extends StorageServices {
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> uploadImage(
      {required File file, required String storagePath}) async {
    try {
      String fileName = b.basename(file.path);
      String extension = b.extension(file.path);
      String path = "$storagePath/$fileName$extension";
      final storageRef = firebaseStorage.ref().child(path);
      await storageRef.putFile(file);
      return await storageRef.getDownloadURL();
    } catch (e) {
      throw ServerException('Failed to upload image');
    }
  }
}
