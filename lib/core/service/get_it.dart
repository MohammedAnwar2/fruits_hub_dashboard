import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/repositories/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/core/repositories/products_repo/products_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:fruits_hub_dashboard/core/service/storage/supabase_storage.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/firestore_services.dart';
import 'package:fruits_hub_dashboard/features/add_products/presentation/cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/data/datasources/order_dashboard_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repositories/order_dashboard_repo_imp.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;
Future<void> initializationGetIt() async {
  _initCoreDependencies();
  _initFeaturesDependencies();
}

void _initCoreDependencies() {
  getIt.registerLazySingleton<StorageServices>(() => SupabaseStorage());
  // getIt.registerLazySingleton<StorageServices>(() => FirebaseStorageServices());
  getIt.registerLazySingleton<DataBaseServices>(() => FirestoreServices());
  getIt.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImp(dataBaseServices: getIt<DataBaseServices>()));
  getIt.registerLazySingleton<ImageRepo>(
      () => ImageRepoImp(storageServices: getIt<StorageServices>()));
  getIt.registerLazySingleton<Uuid>(() => Uuid());
}

void _initFeaturesDependencies() {
  _addProductsFeature();
  _ordersDashboardFeature();
}

void _addProductsFeature() {
  getIt.registerFactory<AddProductsCubit>(() => AddProductsCubit(
        imageRepo: getIt<ImageRepo>(),
        productsRepo: getIt<ProductsRepo>(),
      ));
}

_ordersDashboardFeature() {
  //! cubits
  getIt.registerFactory<OrdersDashboardCubit>(
    () => OrdersDashboardCubit(
      ordersDashboardRepo: getIt<OrderDashboardRepoImp>(),
    ),
  );

  //! repositories
  getIt.registerLazySingleton<OrderDashboardRepoImp>(
    () => OrderDashboardRepoImp(
      orderDashboardRemoteDatasource:
          getIt<OrderDashboardRemoteDatasourceImp>(),
    ),
  );

  //! datasources
  getIt.registerLazySingleton<OrderDashboardRemoteDatasourceImp>(
    () => OrderDashboardRemoteDatasourceImp(
      dataBaseServices: getIt<DataBaseServices>(),
    ),
  );
}
