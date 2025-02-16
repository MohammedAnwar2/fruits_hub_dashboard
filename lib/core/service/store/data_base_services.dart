abstract class DataBaseServices {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });
  Future<dynamic> readData(
      {required String path, String? documentId, Map<String, dynamic>? query});

  Future<bool> checkDataExists(
      {required String path, required String documentId});

  Future<void> update({
    required String path,
    required Map<String, dynamic> data,
    String? docId,Map<String, dynamic>? query
  });
  Future<void> delete({
    required String path,
     String? docId,
     Map<String, dynamic>? query
  });
}
