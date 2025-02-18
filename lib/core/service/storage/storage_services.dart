import 'dart:io';

abstract class StorageServices {
  Future<String> uploadImage({required File file, required String storagePath});
  Future<void> deleteImage({required String imageUrl});
}
