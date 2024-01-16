import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stepel_flutter/core/data/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/data/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/local_storage/local_storage.dart';
import 'package:stepel_flutter/core/domain/repositories/fit_data_repository.dart';
import 'package:stepel_flutter/core/domain/repositories/profile_data_repository.dart';
import 'package:stepel_flutter/core/notifications/notification_service.dart';
import 'package:stepel_flutter/feature/dependencies/model/dependencies.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:stepel_flutter/core/db/database.dart';
import 'package:stepel_flutter/core/pedometr/pedometr_service_background.dart';
import 'package:stepel_flutter/core/router/router.dart';
import 'package:stepel_flutter/feature/app/app.dart';

void main() async => runZonedGuarded(
      () async {
        WidgetsFlutterBinding.ensureInitialized();

        tz.initializeTimeZones();

        final dependencies = await _createDependencies();

        final isFirstAppRun = dependencies.localStorage.getIsFirstAppRun();

        var router = AppRouter(isFirstAppRun: isFirstAppRun);

        runApp(App(
          router: router,
          dependencies: dependencies,
        ));
      },
      (error, stackTrace) {
        log('app:', error: error, stackTrace: stackTrace);
      },
    );

Future<Dependencies> _createDependencies() async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

  final AppDb database = AppDb();

  final LocalStorage localStorage = LocalStorage(sharedPreferences: sharedPreferences);

  final IFitDataRepository fitDataRepository = FitDataRepositoryImpl(stepsDao: database.stepsDao);

  final IProfileDataRepository profileDataRepository = ProfileDataRepositoryImpl(
    localStorage: localStorage,
    cardioPointsGoalDao: database.cardioPointsGoalDao,
    stepsGoalDao: database.stepsGoalDao,
  );

  NotificationService.init();

  PedometrServiceBackground.init();

  final DependenciesImmutable dependencies = DependenciesImmutable(
    localStorage: localStorage,
    fitDataRepository: fitDataRepository,
    profileDataRepository: profileDataRepository,
    database: database,
  );

  return dependencies;
}
