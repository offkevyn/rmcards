import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';
import 'shared/util/app/routes_app.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  List<Module> get imports => [
      ];

  @override
  void routes(r) {
    r.module(
      RoutesApp.Home,
      module: HomeModule(),
      transition: TransitionType.fadeIn,
    );
  }
}
