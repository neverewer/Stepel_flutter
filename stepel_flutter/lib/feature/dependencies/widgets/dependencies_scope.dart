import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:stepel_flutter/feature/dependencies/model/dependencies.dart';

class DependenciesScope extends InheritedWidget {
  /// {@macro dependencies_scope}
  const DependenciesScope({
    required super.child,
    required this.dependencies,
    super.key,
  });

  /// The dependencies
  final Dependencies dependencies;

  /// Get the dependencies from the [context].
  static Dependencies of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<DependenciesScope>()!.dependencies;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      DiagnosticsProperty<Dependencies>('dependencies', dependencies),
    );
  }

  @override
  bool updateShouldNotify(DependenciesScope oldWidget) => false;
}
