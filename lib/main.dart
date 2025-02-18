import 'package:flutter/material.dart';
import 'package:fruits_hub_dashboard/core/functions/on_generate_route.dart';
import 'package:fruits_hub_dashboard/core/service/initialization_services.dart';
import 'package:fruits_hub_dashboard/features/dashboard/presentation/pages/dashboard_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  await InitializationServices.init();
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


      locale: const Locale('en'),
            supportedLocales: const [
              Locale('ar'),
              Locale('en'),
            ],
            localizationsDelegates: const [
              // AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            }
    );
  }
}
