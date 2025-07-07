abstract class HttpUrlUtil {
  static const urlBase = 'https://rickandmortyapi.com/api/';

  static const characterUrl = '${HttpUrlUtil.urlBase}character/';

  static String getCharacterUrl({
    required int page,
    String? name,
  }) {
    return '${HttpUrlUtil.characterUrl}?page=$page${name != null ? '&name=$name' : ''}';
  }

  static String getCharacterById({
    required String id,
  }) {
    return '${HttpUrlUtil.characterUrl}$id';
  }
}
