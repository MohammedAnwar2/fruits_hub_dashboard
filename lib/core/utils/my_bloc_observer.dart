import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    if (kDebugMode) {
      log('🟢 Bloc Created: ${bloc.runtimeType}');
    }
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    if (kDebugMode) {
      final currentState = change.currentState.toString();
      final nextState = change.nextState.toString();
      log('🔄 Bloc State Change: ${bloc.runtimeType}');
      log('   - From: $currentState');
      log('   - To: $nextState');
    }
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    if (kDebugMode) {
      log('❌ Bloc Error: ${bloc.runtimeType}');
      log('   - Error: $error');
    }
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    if (kDebugMode) {
      log('🔴 Bloc Closed: ${bloc.runtimeType}');
    }
  }
}
