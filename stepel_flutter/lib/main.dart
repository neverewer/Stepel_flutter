import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:stepel_flutter/core/router/router.dart';
import 'package:stepel_flutter/feature/app/app.dart';

void main() async => runZonedGuarded(() async {
      WidgetsFlutterBinding.ensureInitialized();
      var router = AppRouter();
      runApp(App(router: router));
    }, (error, stackTrace) {
      log('app:', error: error, stackTrace: stackTrace);
    });
