part of 'orders_mangement_status_cubit.dart';

sealed class OrdersMangementStatusState {
  const OrdersMangementStatusState();
}

final class OrdersMangementStatusInitial extends OrdersMangementStatusState {}

final class OrdersMangementStatusSuccess extends OrdersMangementStatusState {}

final class OrdersMangementStatusError extends OrdersMangementStatusState {
  final String message;
  const OrdersMangementStatusError({required this.message});
}
