import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:uuid/uuid.dart';

String generateProductCode() {
  final uuid = getIt<Uuid>();
  return uuid.v4();
}
