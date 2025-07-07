import 'package:rmcards/app/modules/home/model/character_model.dart';

class SearchCharacterAuxModel {
  List<CharacterModel> characters;
  int count;
  int pages;

  SearchCharacterAuxModel({
    required this.characters,
    required this.count,
    required this.pages,
  });
}