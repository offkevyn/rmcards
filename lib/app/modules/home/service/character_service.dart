import 'package:dio/dio.dart';

import '../../../shared/http/rm_url.dart';
import '../model/character_model.dart';
import '../model/search_character_aux_model.dart';

abstract class ICharacterService {
  Future<SearchCharacterAuxModel> getCharacters(
    int page, {
    String? search,
  });

  Future<List<CharacterModel>> getCharactersBySearch({
    required String name,
  });

  Future<CharacterModel?> getCharacterById({
    required String id,
  });
}

class CharacterService implements ICharacterService {
  final Dio dio;

  CharacterService({required this.dio});

  @override
  Future<List<CharacterModel>> getCharactersBySearch({
    required String name,
  }) async {
    try {
      final List<CharacterModel> characters = [];

      return characters;
    } catch (e) {
      throw Exception('Failed to fetch characters by search: $e');
    }
  }

  @override
  Future<SearchCharacterAuxModel> getCharacters(int page,
      {String? search}) async {
    try {
      final List<CharacterModel> characters = [];
      int count = 0;
      int pages = 0;
      final url = HttpUrlUtil.getCharacterUrl(page: page, name: search);

      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        final info = response.data['info'] as Map<String, dynamic>;
        count = info['count'] as int;
        pages = info['pages'] as int;

        final data = response.data;
        final results = data['results'] as List<dynamic>;
        characters.addAll(results
            .map((e) => CharacterModel.fromJsonApi(e as Map<String, dynamic>))
            .toList());
      }

      return SearchCharacterAuxModel(
        characters: characters,
        count: count,
        pages: pages,
      );
    } catch (e) {
      throw Exception('Failed to fetch characters: $e');
    }
  }

  @override
  Future<CharacterModel?> getCharacterById({
    required String id,
  }) async {
    try {
      final url = HttpUrlUtil.getCharacterById(id: id);

      final response = await dio.get(url);

      if (response.statusCode == 200) {
        final data = response.data;

        return CharacterModel.fromJsonApi(data);
      }

      return null;
    } catch (e) {
      throw Exception('Failed to fetch character by id: $e');
    }
  }
}
