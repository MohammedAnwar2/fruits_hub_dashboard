import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo.dart';
import 'package:fruits_hub_dashboard/core/repositories/images_repo/image_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/service/storage/firebase_storage.dart';
import 'package:fruits_hub_dashboard/features/advertisement/data/datasources/advertisement_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/advertisement/data/repositories/advertisement_repo_imp.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/repositories/advertisement_repo.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/add_advertisement_usecase.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/delete_advertisement_usecase.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/get_advertisement_usecase.dart';
import 'package:fruits_hub_dashboard/features/advertisement/domain/usecases/update_advertisement_usecase.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/add_advertisement_cubit/add_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/update_advertisement_cubit/update_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/advertisement/presentation/cubit/view_and_delete_advertisement_cubit/view_and_delete_advertisement_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/datasource/products_management_datasource.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/repositories/products_repo.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/data/repositories/products_repo_imp.dart';
import 'package:fruits_hub_dashboard/core/service/storage/storage_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/data_base_services.dart';
import 'package:fruits_hub_dashboard/core/service/store/firestore_services.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/add_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/delete_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/update_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/domain/usecase/view_products_usecase.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/add_products_cubit/add_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/orders/data/datasources/order_dashboard_remote_datasource.dart';
import 'package:fruits_hub_dashboard/features/orders/data/repositories/order_dashboard_repo_imp.dart';
import 'package:fruits_hub_dashboard/features/orders/presentation/cubit/orders_dashboard_cubit/orders_dashboard_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/update_products_cubit/update_products_cubit.dart';
import 'package:fruits_hub_dashboard/features/product_mangement/presentation/cubit/view_and_delete_cubit/view_and_delete_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

final getIt = GetIt.instance;
Future<void> initializationGetIt() async {
  _initCoreDependencies();
  _initFeaturesDependencies();
}

void _initCoreDependencies() {
  // getIt.registerLazySingleton<StorageServices>(() => SupabaseStorage());
  getIt.registerLazySingleton<StorageServices>(() => FirebaseStorageServices());
  getIt.registerLazySingleton<DataBaseServices>(() => FirestoreServices());

  getIt.registerLazySingleton<ImageRepo>(
      () => ImageRepoImp(storageServices: getIt<StorageServices>()));
  getIt.registerLazySingleton<Uuid>(() => Uuid());
}
//
void _initFeaturesDependencies() {
  _productsManagementFeature();
  _ordersDashboardFeature();
  _advertisementManagementFeature();
}

void _productsManagementFeature() {
  //! cubits
     getIt.registerFactory<AddProductsCubit>(() => AddProductsCubit(
        imageRepo: getIt<ImageRepo>(),
        addProductsUsecase: getIt<AddProductsUsecase>(),
      ));
     getIt.registerFactory<ViewAndDeleteCubit>(() => ViewAndDeleteCubit(
        imageRepo: getIt<ImageRepo>(),
        deleteProductsUsecase: getIt<DeleteProductsUsecase>(),
        viewProductsUsecase: getIt<ViewProductsUsecase>(),
      ));
      getIt.registerFactory<UpdateProductsCubit>(() => UpdateProductsCubit(
          updateProductsUsecase: getIt<UpdateProductsUsecase>(),
          imageRepo: getIt<ImageRepo>(),
        ));
  //! usecases
      getIt.registerLazySingleton<AddProductsUsecase >(() => AddProductsUsecase(
      productsRepo: getIt<ProductsRepo>(),
    ));
      getIt.registerLazySingleton<DeleteProductsUsecase>(() => DeleteProductsUsecase(
            productsRepo: getIt<ProductsRepo>(),
          ));
      getIt.registerLazySingleton<UpdateProductsUsecase>(() => UpdateProductsUsecase(
            productsRepo: getIt<ProductsRepo>(),
          ));
      getIt.registerLazySingleton<ViewProductsUsecase>(() => ViewProductsUsecase(
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

_advertisementManagementFeature() {
  //! cubits
  getIt.registerFactory<AddAdvertisementCubit>(
    () => AddAdvertisementCubit(
      addAdvertisementUsecase: getIt<AddAdvertisementUsecase>(),
      imageRepo: getIt<ImageRepo>(),
    ),
  );

  getIt.registerFactory<UpdateAdvertisementCubit>(
    () => UpdateAdvertisementCubit(
      updateAdvertisementUsecase: getIt<UpdateAdvertisementUsecase>(),
      imageRepo: getIt<ImageRepo>(),
    ),
  );

  getIt.registerFactory<ViewAndDeleteAdvertisementCubit>(
    () => ViewAndDeleteAdvertisementCubit(
      imageRepo: getIt<ImageRepo>(),
      deleteAdvertisementUsecase: getIt<DeleteAdvertisementUsecase>(),
      viewAdvertisementUsecase: getIt<GetAdvertisementUsecase>(),
    ),
  );

  //! usecases
  getIt.registerLazySingleton<AddAdvertisementUsecase>(
    () => AddAdvertisementUsecase(
      advertisementRepo: getIt<AdvertisementRepo>(),
    ),
  );
  getIt.registerLazySingleton<UpdateAdvertisementUsecase>(
    () => UpdateAdvertisementUsecase(
      advertisementRepo: getIt<AdvertisementRepo>(),
    ),
  );
  getIt.registerLazySingleton<DeleteAdvertisementUsecase>(
    () => DeleteAdvertisementUsecase(
      advertisementRepo: getIt<AdvertisementRepo>(),
    ),
  );

  getIt.registerLazySingleton<GetAdvertisementUsecase>(
    () => GetAdvertisementUsecase(
      advertisementRepo: getIt<AdvertisementRepo>(),
    ),
  );

  //! repositories
  getIt.registerLazySingleton<AdvertisementRepo>(
    () => AdvertisementRepoImp(
      advertisementsManagementDatasource: getIt<AdvertisementRemoteDatasource>(),
    ),
  );

  //! datasources
  getIt.registerLazySingleton<AdvertisementRemoteDatasource>(
    () => AdvertisementRemoteDatasourceImp(
      dataBaseServices: getIt<DataBaseServices>(),
    ),
  );
  
}
