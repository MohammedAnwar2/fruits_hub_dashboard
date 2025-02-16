import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_hub_dashboard/core/service/get_it.dart';
import 'package:fruits_hub_dashboard/core/service/storage/supabase_storage.dart';
import 'package:fruits_hub_dashboard/core/utils/my_bloc_observer.dart';
import 'package:fruits_hub_dashboard/firebase_options.dart';

class InitializationServices {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SupabaseStorage.init();
    initializationGetIt();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    Bloc.observer = MyBlocObserver();
  }
}
