import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/query_model.dart';
import 'package:fruits_hub_dashboard/core/utils/backendend_endpoint.dart';
import 'package:fruits_hub_dashboard/features/orders_dashboard/data/models/order_model.dart';

abstract class OrderDashboardRemoteDatasource {
  Future<List<OrderModel>> getPendingOrders();

  Future<List<OrderModel>> getArchivedOrders();

  Future<void> nextStatus(OrderModel  orderModel, int status);

  Future<void> previousStatus(String docId, int status);

  Future<void> deleteOrder(String docId);
}

class OrderDashboardRemoteDatasourceImp
    implements OrderDashboardRemoteDatasource {
  final DataBaseServices dataBaseServices;

  OrderDashboardRemoteDatasourceImp({required this.dataBaseServices});
  @override
  Future<List<OrderModel>> getPendingOrders() async {
    QueryModel queryModel = QueryModel(
      where: [
        WhereFilter(
          field: BackendendEndpoint.statusOrdersField,
          isLessThanOrEqualTo: 3,
        ),
      ],
      orderBy: BackendendEndpoint.orderDateOrderField,
      descending: true,
    );
    List<Map<String, dynamic>> data = await dataBaseServices.readData(
        path: BackendendEndpoint.orderDashboard, query: queryModel.toMap());

    List<OrderModel> orders = data.map((e) => OrderModel.fromJson(e)).toList();
    return orders;
  }

  @override
  Future<List<OrderModel>> getArchivedOrders() async {
    QueryModel queryModel = QueryModel(
      where: [
        WhereFilter(
          field: BackendendEndpoint.statusOrdersField,
          isEqualTo: 4,
        ),
      ],
      orderBy: BackendendEndpoint.orderDateOrderField,
      descending: true,
    );
    List<Map<String, dynamic>> data = await dataBaseServices.readData(
        path: BackendendEndpoint.orderDashboard, query: queryModel.toMap());

    List<OrderModel> orders = data.map((e) => OrderModel.fromJson(e)).toList();
    return orders;
  }

   @override
  Future<void> deleteOrder(String docId) async {
    await dataBaseServices.delete(
      path: BackendendEndpoint.orderDashboard,
      docId: docId,
    );
  }

  @override
  Future<void> nextStatus(OrderModel  orderModel, int status) async {
      QueryModel queryModel = QueryModel(
      where: [
        WhereFilter(
          field: BackendendEndpoint.orderidOrdersField,
          isEqualTo: orderModel.orderid,
        ),
      ],
      );
    await dataBaseServices.update(
      path: BackendendEndpoint.orderDashboard,
      query: queryModel.toMap(),
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
