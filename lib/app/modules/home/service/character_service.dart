import 'package:dio/dio.dart';

import '../../../shared/http/rm_url.dart';
import '../model/character_model.dart';

abstract class ICharacterService {
  Future<List<CharacterModel>> getCharacters(
    int page,
  );

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
  Future<List<CharacterModel>> getCharacters(int page) async {
    try {
      final List<CharacterModel> characters = [];
      final url = HttpUrlUtil.getCharacterUrl(page: page);

      final response = await dio.get(
        url,
      );

      if (response.statusCode == 200) {
        final data = response.data;
        final results = data['results'] as List<dynamic>;
        characters.addAll(results
            .map((e) => CharacterModel.fromJsonApi(e as Map<String, dynamic>))
            .toList());
      }

      return characters;
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
