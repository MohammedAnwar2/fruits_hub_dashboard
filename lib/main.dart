import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fruits_hub_dashboard/core/functions/on_generate_route.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/pages/dashboard_view.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializationGetIt();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: DashboardView.routeName,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
