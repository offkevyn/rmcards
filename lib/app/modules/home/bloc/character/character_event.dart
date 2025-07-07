import 'package:equatable/equatable.dart';

abstract class CharacterEvent extends Equatable {
  const CharacterEvent();

  @override
  List<Object?> get props => [];
}

class LoadCharactersEvent extends CharacterEvent {
  final String? search;

  const LoadCharactersEvent({this.search});

  @override
  List<Object?> get props => [search];
}

class LoadCharacterByIdEvent extends CharacterEvent {
  final String id;

  const LoadCharacterByIdEvent(this.id);

  @override
  List<Object?> get props => [id];
}

