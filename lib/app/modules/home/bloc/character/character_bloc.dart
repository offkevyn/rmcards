import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/character_service.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ICharacterService _characterService;
  int _currentPage = 1;
  int _totalPages = 0;

  bool get hasReachedMax => _currentPage > _totalPages;

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
    // Verificar se já chegou ao máximo ou se já está carregando
    if (_currentPage > _totalPages && _totalPages > 0) return;

    if (_currentPage == 1) {
      emit(CharacterLoadingState());
    }

    try {
      final result = await _characterService.getCharacters(_currentPage);
      _totalPages = result.pages;
      _currentPage++;

      if (_currentPage == 2) {
        emit(CharactersLoadedState(
          characters: result.characters,
          isSearching: event.search != null,
        ));
      } else {
        final currentState = state;
        if (currentState is CharactersLoadedState) {
          final updatedCharacters = [
            ...currentState.characters,
            ...result.characters
          ];
          emit(CharactersLoadedState(
            characters: updatedCharacters,
            isSearching: event.search != null,
          ));
        }
      }
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
