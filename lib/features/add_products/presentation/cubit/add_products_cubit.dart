import 'package:flutter_bloc/flutter_bloc.dart';
part 'add_products_state.dart';

class AddProductsCubit extends Cubit<AddProductsState> {
  AddProductsCubit() : super(AddProductsInitial());
}
