import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

import 'package:stepel_flutter/core/db/daos/cardio_points_goal_dao.dart';
import 'package:stepel_flutter/core/db/daos/steps_dao.dart';
import 'package:stepel_flutter/core/db/daos/steps_goal_dao.dart';

import 'package:stepel_flutter/core/db/tables/cardio_points_goal.dart';
import 'package:stepel_flutter/core/db/tables/steps.dart';
import 'package:stepel_flutter/core/db/tables/steps_goal.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Steps, CardioPointsGoal, StepsGoal], daos: [StepsDao, StepsGoalDao, CardioPointsGoalDao])
class AppDb extends _$AppDb {
  // we tell the database where to store the data with this constructor
  AppDb() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

//   @override
// MigrationStrategy get migration {
//   return MigrationStrategy(
//     onCreate: (Migrator m) async {
//       await m.createAll();
//     },
//     onUpgrade: (Migrator m, int from, int to) async {
//       if (from < 2) {
//         // add new tables
//         // version 2
//         await m.create()
//       }
//     },
//   );

  // Future<int> deleteAllData() async => await delete(steps).go();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
