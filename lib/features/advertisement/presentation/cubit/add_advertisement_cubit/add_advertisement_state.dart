part of 'add_advertisement_cubit.dart';

sealed class AddAdvertisementState {
  const AddAdvertisementState();

}

final class AddAdvertisementInitial extends AddAdvertisementState {}

class AddAdvertisementLoading extends AddAdvertisementState {}

class AddAdvertisementSuccess extends AddAdvertisementState {}

class AddAdvertisementFailure extends AddAdvertisementState {
  final String message;
  const AddAdvertisementFailure({required this.message});
}
