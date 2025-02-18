part of 'view_and_delete_advertisement_cubit.dart';

sealed class ViewAndDeleteAdvertisementState  {
  const ViewAndDeleteAdvertisementState();

}

final class ViewAndDeleteAdvertisementInitial extends ViewAndDeleteAdvertisementState {}

class ViewAdvertisementLoading extends ViewAndDeleteAdvertisementState {}
class DeleteAdvertisementLoading extends ViewAndDeleteAdvertisementState {}
class ViewAdvertisementSuccess extends ViewAndDeleteAdvertisementState {
  final List<AdvertisementEntity> advertisements;
  const ViewAdvertisementSuccess({required this.advertisements});
}
class DeleteAdvertisementSuccess extends ViewAndDeleteAdvertisementState {}
class ViewAndDeleteAdvertisementFailure extends ViewAndDeleteAdvertisementState {
  final String errorMessage;
  const ViewAndDeleteAdvertisementFailure({required this.errorMessage});
}
