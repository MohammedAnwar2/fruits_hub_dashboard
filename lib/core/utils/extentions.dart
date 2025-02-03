import 'package:flutter/material.dart';

extension NavigationArguments on BuildContext {
  T getArguments<T>() {
    final args = ModalRoute.of(this)?.settings.arguments;
    if (args is T) {
      return args;
    } else {
      throw Exception(
          "Expected arguments of type $T but found ${args.runtimeType}");
    }
  }
}

extension ColorOpacity on Color {
  Color withCustomOpacity(double opacity) {
    return withAlpha((opacity * 255).toInt());
  }
}
