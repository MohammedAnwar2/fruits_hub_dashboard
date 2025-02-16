import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/error/exceptions.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/query_model.dart';

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
  Future<dynamic> readData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    if (documentId == null) {
      List<String> separatePaths = path.split("/");
      if (separatePaths.length > 1) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await firestore
            .collection(separatePaths[0])
            .doc(documentId)
            .collection(separatePaths[1])
            .get();
        return querySnapshot.docs.map((doc) => doc.data()).toList();
      } else {
        Query<Map<String, dynamic>> data = firestore.collection(path);
        if (query != null) {
          data = filter(query, data);
        }
        var result = await data.get();
        return result.docs.map((doc) => doc.data()).toList();
      }
    } else {
      DocumentSnapshot<Map<String, dynamic>> doc =
          await firestore.collection(path).doc(documentId).get();
      return doc.data() ?? {};
    }
  }

  @override
  Future<bool> checkDataExists(
      {required String path, required String documentId}) async {
    DocumentSnapshot<Map<String, dynamic>> doc =
        await firestore.collection(path).doc(documentId).get();
    return doc.exists;
  }


Future<void> update({
  required String path,
  required Map<String, dynamic> data,
  String? docId,
  Map<String, dynamic>? query,
}) async {
  if (docId == null) {
    if (query != null) {
    Query<Map<String, dynamic>> allData = firestore.collection(path);
      allData = filter(query, allData);
      // print(allData.toString());
      var value = await allData.get(); // استخدام await لضمان تنفيذ الاستعلام أولا
      print(value.docs.toString());

      if (value.docs.isEmpty) {
        print("not found =============================");
        return; // إنهاء الدالة إذا لم يتم العثور على مستندات
      }

      // تحديث جميع المستندات المطابقة
      await Future.wait(value.docs.map((element) async {
        print("${element.id} =============================");
        await firestore.collection(path).doc(element.id).update(data);
      }));

    } else {
      throw ServerException('Document Id is required for update');
    }
  } else {
    await firestore.collection(path).doc(docId).update(data);
  }
}


  @override
  Future<void> delete({required String path, required String docId}) {
    return firestore.collection(path).doc(docId).delete();
  }

  Query<Map<String, dynamic>> filter(Map<String, dynamic> query, Query<Map<String, dynamic>> data) {
    if (query[QueryConstants.orderBy.name] != null) {
      String orderBy = query[QueryConstants.orderBy.name];
      bool descending = query[QueryConstants.descending.name] ?? false;
      data = data.orderBy(orderBy, descending: descending);
    }
    if (query[QueryConstants.limit.name] != null) {
      int limit = query[QueryConstants.limit.name];
      data = data.limit(limit);
    }
    // Apply where filters
    if (query.containsKey(QueryConstants.where.name)) {
      List<Map<String, dynamic>> whereFilters =
          List<Map<String, dynamic>>.from(
              query[QueryConstants.where.name]);
    
      for (var filter in whereFilters) {
        String field = filter[QueryWhereConstants.field.name];
    
        if (filter.containsKey(QueryWhereConstants.isEqualTo.name)) {
          data = data.where(field,
              isEqualTo: filter[QueryWhereConstants.isEqualTo.name]);
        }
        if (filter.containsKey(QueryWhereConstants.isNotEqualTo.name)) {
          data = data.where(field,
              isNotEqualTo:
                  filter[QueryWhereConstants.isNotEqualTo.name]);
                  
        }
        if (filter.containsKey(QueryWhereConstants.isGreaterThan.name)) {
          data = data.where(field,
              isGreaterThan:
                  filter[QueryWhereConstants.isGreaterThan.name]);
        }
        if (filter.containsKey(QueryWhereConstants.isLessThan.name)) {
          data = data.where(field,
              isLessThan: filter[QueryWhereConstants.isLessThan.name]);
        }
        if (filter.containsKey(
            QueryWhereConstants.isGreaterThanOrEqualTo.name)) {
          data = data.where(field,
              isGreaterThanOrEqualTo: filter[
                  QueryWhereConstants.isGreaterThanOrEqualTo.name]);
        }
        if (filter
            .containsKey(QueryWhereConstants.isLessThanOrEqualTo.name)) {
          data = data.where(field,
              isLessThanOrEqualTo:
                  filter[QueryWhereConstants.isLessThanOrEqualTo.name]);
        }
        if (filter.containsKey(QueryWhereConstants.arrayContains.name)) {
          data = data.where(field,
              arrayContains:
                  filter[QueryWhereConstants.arrayContains.name]);
        }
        if (filter
            .containsKey(QueryWhereConstants.arrayContainsAny.name)) {
          data = data.where(field,
              arrayContainsAny:
                  filter[QueryWhereConstants.arrayContainsAny.name]);
        }
        if (filter.containsKey(QueryWhereConstants.whereIn.name)) {
          data = data.where(field,
              whereIn: filter[QueryWhereConstants.whereIn.name]);
        }
        if (filter.containsKey(QueryWhereConstants.whereNotIn.name)) {
          data = data.where(field,
              whereNotIn: filter[QueryWhereConstants.whereNotIn.name]);
        }
      }
    }
    return data;
  }

}
