import 'package:flutter_modular/flutter_modular.dart';

import 'view/home_view.dart';

class HomeModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const HomeView(),
    );
    r.wildcard(child: (_) => const HomeView());
  }
}
