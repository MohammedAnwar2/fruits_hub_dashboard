part of 'add_products_cubit.dart';

abstract class AddProductsState {
  const AddProductsState();
}

class AddProductsInitial extends AddProductsState {}

class AddProductsLoading extends AddProductsState {}

class AddProductsSuccess extends AddProductsState {}

class AddProductsFailure extends AddProductsState {
  final String errorMessage;
  const AddProductsFailure({required this.errorMessage});
}
