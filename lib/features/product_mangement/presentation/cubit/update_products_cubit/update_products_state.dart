part of 'update_products_cubit.dart';

sealed class UpdateProductsState  {
  const UpdateProductsState();


}

final class UpdateProductsInitial extends UpdateProductsState {}

final class UpdateProductsLoading extends UpdateProductsState {}

final class UpdateProductsSuccess extends UpdateProductsState {}

final class UpdateProductsFailure extends UpdateProductsState {
  final String errorMessage;
  const UpdateProductsFailure({required this.errorMessage});
}
