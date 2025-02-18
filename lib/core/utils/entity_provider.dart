import 'package:flutter/material.dart';

class EntityProvider<T> extends InheritedWidget {
  static final Map<Type, EntityProvider> _instances = {};

  const EntityProvider._internal({
    super.key,
    required this.entity,
    required super.child,
  });

  final T entity;

  static Widget create<T>({required T entity, required Widget child}) {
    if (_instances[T] != null) {
      return _instances[T]!; // Return existing instance
    }

    final provider = EntityProvider<T>._internal(entity: entity, child: child);
    _instances[T] = provider;
    return provider;
  }

  static dispose<T>() {
    _instances.remove(T);
  }

  static T? read<T>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<EntityProvider<T>>()
        ?.entity;
  }

  @override
  bool updateShouldNotify(EntityProvider<T> oldWidget) {
    return entity != oldWidget.entity;
  }
}
