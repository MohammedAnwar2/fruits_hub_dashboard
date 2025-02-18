part of 'update_advertisement_cubit.dart';

sealed class UpdateAdvertisementState  {
  const UpdateAdvertisementState();

}

final class UpdateAdvertisementInitial extends UpdateAdvertisementState {}

class UpdateAdvertisementLoading extends UpdateAdvertisementState {}
class UpdateAdvertisementSuccess extends UpdateAdvertisementState {}
class UpdateAdvertisementFailure extends UpdateAdvertisementState {
  final String errorMessage;
  const UpdateAdvertisementFailure({required this.errorMessage});
}
