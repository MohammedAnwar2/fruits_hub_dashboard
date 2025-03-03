part of 'get_it_index.dart';

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
