import 'package:dio/dio.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/datasource/search_characters_datasource.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/models/result_characters_model.dart';

import '../../../../core/config/config_env.dart';

class MarvelCharactersDatasourceImpl implements SearchCharactersDatasource {
  final Dio dio;

  MarvelCharactersDatasourceImpl({required this.dio});

  @override
  Future<List<ResultCharactersModel>> getCharacters() async {
    try {
      final response = await dio.get(
        '${ConfigEnv.basePath}${ConfigEnv.charactersPath}',
        queryParameters: {
          'apikey': ConfigEnv.apiKey,
          'hash': ConfigEnv.hash,
          'ts': 1,
        },
      );
      if (response.statusCode == 200) {
        List<ResultCharactersModel> characterList = [];

        List results = response.data['data']['results'];

        characterList =
            results.map((e) => ResultCharactersModel.fromMap(e)).toList();

        return characterList;
      } else {
        throw DataSourceFailure();
      }
    } catch (e) {
      throw DataSourceFailure();
    }
  }
}
