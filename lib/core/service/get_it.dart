import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo_imp.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/datasource/products_management_datasource.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/repositories/products_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:fruits_hub_dashboard/core/service/storage/supabase_storage.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/firestore_services.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/add_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/add_products_cubit/add_products_cubit.dart';
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

  getIt.registerLazySingleton<ImageRepo>(
      () => ImageRepoImp(storageServices: getIt<StorageServices>()));
  getIt.registerLazySingleton<Uuid>(() => Uuid());
}
//
void _initFeaturesDependencies() {
  _addProductsFeature();
  _ordersDashboardFeature();
}

void _addProductsFeature() {
  //! cubits
  getIt.registerFactory<ProductsManagementCubit>(() => ProductsManagementCubit(
        imageRepo: getIt<ImageRepo>(),
        addProductsUsecase: getIt<AddProductsUsecase>(),
      ));
  //! usecases
  getIt.registerLazySingleton<AddProductsUsecase >(() => AddProductsUsecase(
        productsRepo: getIt<ProductsRepo>(),
      ));
  //! repositories
     getIt.registerLazySingleton<ProductsRepo>(
      () => ProductsRepoImp( productsManagementDatasource: getIt<ProductsManagementDatasource>()));
  //! datasources
  getIt.registerLazySingleton<ProductsManagementDatasource>(
      () => ProductsManagementDatasourceImp(dataBaseServices: getIt<DataBaseServices>()));
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
