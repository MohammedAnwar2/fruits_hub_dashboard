import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';

abstract class OrderMangementStatusdRemoteDatasource {
  Future<void> nextStatus(String docId, int status);

  Future<void> previousStatus(String docId, int status);

  Future<void> deleteOrder(String docId);
}

class OrderMangementStatusdRemoteDatasourceImp
    implements OrderMangementStatusdRemoteDatasource {
  final DataBaseServices dataBaseServices;

  OrderMangementStatusdRemoteDatasourceImp({required this.dataBaseServices});
  @override
  Future<void> deleteOrder(String docId) async {
    await dataBaseServices.delete(
      path: BackendendEndpoint.orderDashboard,
      docId: docId,
    );
  }

  @override
  Future<void> nextStatus(String docId, int status) async {
    await dataBaseServices.update(
      path: BackendendEndpoint.orderDashboard,
      docId: docId,
      data: {
        BackendendEndpoint.statusOrdersField: status,
      },
    );
  }

  @override
  Future<void> previousStatus(String docId, int status) async {
    await dataBaseServices.update(
      path: BackendendEndpoint.orderDashboard,
      docId: docId,
      data: {
        BackendendEndpoint.statusOrdersField: status,
      },
    );
  }
}
