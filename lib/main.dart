import 'package:flutter/material.dart' show WidgetsFlutterBinding, runApp;
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/shared/util/app/routes_app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  Modular.setInitialRoute(RoutesApp.Home);

  // await Firebase.initializeApp(
  // options: DefaultFirebaseOptions.currentPlatform,
  // );

  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
