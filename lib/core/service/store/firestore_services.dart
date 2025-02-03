import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';

class FirestoreServices extends DataBaseServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId == null) {
      await firestore.collection(path).add(data);
    } else {
      await firestore.collection(path).doc(docId).set(data);
    }
  }

  @override
  Future<Map<String, dynamic>> readData(
      {required String path, required String documetId}) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection(path).doc(documetId).get();
    return doc.data() ?? {};
  }

  @override
  Future<bool> checkDataExists(
      {required String path, required String documetId}) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection(path).doc(documetId).get();
    return doc.exists;
  }
}
