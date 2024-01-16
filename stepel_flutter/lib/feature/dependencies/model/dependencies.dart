import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/local_storage/local_storage.dart';
import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';

abstract class Dependencies {
  const Dependencies();

  abstract final LocalStorage localStorage;

  abstract final IFitDataRepository fitDataRepository;

  abstract final IProfileDataRepository profileDataRepository;

  abstract final AppDb database;

  Dependencies freeze();
}

final class DependenciesImmutable extends Dependencies {
  DependenciesImmutable({
    required this.fitDataRepository,
    required this.profileDataRepository,
    required this.localStorage,
    required this.database,
  });

  @override
  final LocalStorage localStorage;

  @override
  final IFitDataRepository fitDataRepository;

  @override
  final IProfileDataRepository profileDataRepository;

  @override
  final AppDb database;

  @override
  Dependencies freeze() => this;
}

// final class _DependenciesImmutable extends Dependencies {
//   const _DependenciesImmutable({
//     required this.localStorage,
//   });

//   @override
//   final LocalStorage localStorage;

//   @override
//   Dependencies freeze() => this;
// }
