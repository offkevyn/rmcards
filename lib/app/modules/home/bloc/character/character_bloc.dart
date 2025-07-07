import 'package:flutter_bloc/flutter_bloc.dart';

import '../../service/character_service.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final ICharacterService _characterService;
  int _currentPage = 1;
  int _totalPages = 0;
  String? _currentSearch;
  bool _isLoading = false;
  bool _hasReachedMax = false;

  bool get hasReachedMax => _hasReachedMax;
  bool get isLoading => _isLoading;

  CharacterBloc({
    required ICharacterService characterService,
  })  : _characterService = characterService,
        super(CharacterInitialState()) {
    on<LoadCharactersEvent>(_onLoadCharacters);
    on<LoadCharacterByIdEvent>(_onLoadCharacterById);
    on<SearchCharactersEvent>(_onSearchCharacters);
  }

  Future<void> _onLoadCharacters(
    LoadCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    // Verificar se já chegou ao máximo ou se já está carregando
    if (_hasReachedMax || _isLoading) return;

    _isLoading = true;

    if (_currentPage == 1) {
      emit(CharacterLoadingState());
    }

    try {
      final result = await _characterService.getCharacters(
        _currentPage,
        search: _currentSearch,
      );

      _totalPages = result.pages;

      // Verificar se chegamos ao máximo
      if (_currentPage >= _totalPages) {
        _hasReachedMax = true;
      }

      if (_currentPage == 1) {
        // Primeira página
        emit(CharactersLoadedState(
          characters: result.characters,
          isSearching: _currentSearch != null && _currentSearch!.isNotEmpty,
        ));
      } else {
        // Páginas subsequentes
        final currentState = state;
        if (currentState is CharactersLoadedState) {
          final updatedCharacters = [
            ...currentState.characters,
            ...result.characters
          ];
          emit(CharactersLoadedState(
            characters: updatedCharacters,
            isSearching: _currentSearch != null && _currentSearch!.isNotEmpty,
          ));
        }
      }

      _currentPage++;
    } catch (e) {
      emit(CharacterErrorState(message: e.toString()));
    } finally {
      _isLoading = false;
    }
  }

  Future<void> _onSearchCharacters(
    SearchCharactersEvent event,
    Emitter<CharacterState> emit,
  ) async {
    _currentSearch = event.search;
    _currentPage = 1;
    _totalPages = 0;
    _isLoading = false;
    _hasReachedMax = false;

    add(const LoadCharactersEvent());
  }

  Future<void> _onLoadCharacterById(
    LoadCharacterByIdEvent event,
    Emitter<CharacterState> emit,
  ) async {
    if (_isLoading) return;

    _isLoading = true;
    emit(CharacterLoadingState());

    try {
      final character = await _characterService.getCharacterById(id: event.id);

      emit(CharacterLoadedState(character: character));
    } catch (e) {
      emit(CharacterErrorState(message: e.toString()));
    } finally {
      _isLoading = false;
    }
  }
}
