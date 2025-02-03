abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<Map<String, dynamic>> readData(
      {required String path, required String documetId});

  Future<bool> checkDataExists(
      {required String path, required String documetId});
  // Future<void> update();
  // Future<void> delete();
}
