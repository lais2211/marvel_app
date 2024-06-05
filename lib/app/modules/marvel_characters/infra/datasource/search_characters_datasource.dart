import 'package:marvel_app/app/modules/marvel_characters/infra/models/result_characters_model.dart';

abstract class SearchCharactersDatasource {
  Future<List<ResultCharactersModel>> getCharacters(
      {int? comicId, int? offset});
}
