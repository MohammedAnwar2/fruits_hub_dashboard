part of 'view_and_delete_cubit.dart';

sealed class ViewAndDeleteState {
  const ViewAndDeleteState();

}

final class ViewAndDeleteInitial extends ViewAndDeleteState {}

class ViewLoading extends ViewAndDeleteState {}
class DeleteLoading extends ViewAndDeleteState {}

class ViewLoaded extends ViewAndDeleteState {
  final List<ProductEntities> products;
  const ViewLoaded({required this.products});
}

class DeleteSuccess extends ViewAndDeleteState {}

class ViewAndDeleteFailure extends ViewAndDeleteState {
  final String errorMessage;
  const ViewAndDeleteFailure({required this.errorMessage});
}
