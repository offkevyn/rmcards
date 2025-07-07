import 'package:equatable/equatable.dart';

import '../../model/character_model.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();

  @override
  List<Object?> get props => [];
}

class CharacterInitialState extends CharacterState {}

class CharacterLoadingState extends CharacterState {}

class CharactersLoadedState extends CharacterState {
  final List<CharacterModel> characters;
  final bool isSearching;

  const CharactersLoadedState({
    required this.characters,
    required this.isSearching,
  });

  @override
  List<Object?> get props => [characters, isSearching];
}

class CharacterLoadedState extends CharacterState {
  final CharacterModel? character;

  const CharacterLoadedState({
    required this.character,
  });

  @override
  List<Object?> get props => [character];
}

class CharacterErrorState extends CharacterState {
  final String message;

  const CharacterErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
