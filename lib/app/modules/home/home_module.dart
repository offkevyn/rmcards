import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'bloc/character/character_bloc.dart';
import 'service/character_service.dart';
import 'view/home_view.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.addLazySingleton<Dio>(() => Dio());
    i.addLazySingleton<ICharacterService>(
      () => CharacterService(dio: i()),
    );
    i.addLazySingleton(
      () => CharacterBloc(
        characterService: i(),
      ),
    );
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (_) => const HomeView(),
    );
    r.wildcard(child: (_) => const HomeView());
  }
}
