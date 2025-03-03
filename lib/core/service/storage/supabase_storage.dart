import 'dart:io';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:path/path.dart' as b;
import 'package:uuid/uuid.dart';

class SupabaseStorage extends StorageServices {
  static final Supabase _supabase = Supabase.instance;

  static Future<void> init() async {
    await Supabase.initialize(
      url: BackendendEndpoint.projectUrl,
      anonKey: BackendendEndpoint.projectKey,
    );

    //====>> The recommended approach is to create the bucket directly from the Supabase dashboard <<====
    //====>> The following is how to create a bucket programmatically from Flutter <<====

    // final List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    // bool bucketExists = buckets.any((bucket) => bucket.name == BackendendEndpoint.bucketName);
    // if (!bucketExists) {
    //   await _supabase.client.storage.createBucket(BackendendEndpoint.bucketName);
    // }
  }

  @override
  Future<String> uploadImage(
      {required File file, required String storagePath}) async {
    try {
      // String fileName = b.basename(file.path);
      String fileName = getIt<Uuid>().v4();
      String extension = b.extension(file.path);
      String path = "$storagePath/$fileName$extension";
      await _supabase.client.storage
          .from(BackendendEndpoint.fruitsBucketName)
          .upload(path, file);

      String imageUrl = _supabase.client.storage
          .from(BackendendEndpoint.fruitsBucketName)
          .getPublicUrl(path);
      return imageUrl;
    } catch (e) {
      throw ServerException('Failed to upload image');
    }
  }

  @override
  Future<void> deleteImage({required String imageUrl}) async {
    try {
      String path = extractImagePath(imageUrl);
      await _supabase.client.storage
          .from(BackendendEndpoint.fruitsBucketName)
          .remove([path]);
    } catch (e) {
      throw ServerException('Failed to delete image');
    }
  }

  String extractImagePath(String imageUrl) {
    const String baseUrl =
        '${BackendendEndpoint.projectUrl}/storage/v1/object/public/${BackendendEndpoint.fruitsBucketName}/';
    return imageUrl.replaceFirst(baseUrl, '');
  }
}
