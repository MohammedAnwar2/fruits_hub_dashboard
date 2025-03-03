import 'package:fruits_hub_dashboard/config/get_it_index.dart';
import 'package:uuid/uuid.dart';

String generateProductCode() {
  final uuid = getIt<Uuid>();
  return uuid.v4();
}
