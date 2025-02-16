import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'update_products_state.dart';

class UpdateProductsCubit extends Cubit<UpdateProductsState> {
  UpdateProductsCubit() : super(UpdateProductsInitial());
}
