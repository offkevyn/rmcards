import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/character_service.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ICharacterService _characterService;

  CharacterBloc({
    required ICharacterService characterService,
  })  : _characterService = characterService,
        super(CharacterInitialState()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadCharacterByIdEvent>(_onLoadCharacterById);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoadingState());
    try {
      final characters = await _characterService.getCharacters(event.page);

      emit(CharactersLoadedState(
        characters: characters,
        isSearching: event.search != null,
      ));
    } catch (e) {
      emit(CharacterErrorState(message: e.toString()));
    }
  }

  Future<void> _onLoadCharacterById(
    LoadCharacterByIdEvent event,
    Emitter<CharacterState> emit,
  ) async {
    emit(CharacterLoadingState());
    try {
      final character = await _characterService.getCharacterById(id: event.id);

      emit(CharacterLoadedState(character: character));
    } catch (e) {
      emit(CharacterErrorState(message: e.toString()));
    }
  }
}
