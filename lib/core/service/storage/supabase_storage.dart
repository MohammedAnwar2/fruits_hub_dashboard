import 'dart:io';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/core/utils/app_constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:path/path.dart' as b;

class SupabaseStorage extends StorageServices {
  static final Supabase _supabase = Supabase.instance;

  static Future<void> init() async {
    await Supabase.initialize(
      url: AppConstants.projectUrl,
      anonKey: AppConstants.projectKey,
    );

    final List<Bucket> buckets = await _supabase.client.storage.listBuckets();
    bool bucketExists = buckets.any((bucket) => bucket.name == 'fruits');
    if (!bucketExists) {
      await _supabase.client.storage.createBucket('fruits');
    }
  }

  @override
  Future<String> uploadImage(
      {required File file, required String storagePath}) async {
    try {
      String fileName = b.basename(file.path);
      String extension = b.extension(file.path);
      String path = "$storagePath/$fileName$extension";
      await _supabase.client.storage.from('fruits').upload(path, file);

      String imageUrl =
          _supabase.client.storage.from('fruits').getPublicUrl(path);
      return imageUrl;
    } catch (e) {
      throw ServerException('Failed to upload image');
    }
  }
}

//the best thing is creating the bucker for the dashbard of supabase
