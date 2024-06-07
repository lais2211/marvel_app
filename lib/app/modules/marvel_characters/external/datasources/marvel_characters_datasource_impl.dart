import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/datasource/search_characters_datasource.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/models/result_characters_model.dart';

import '../../../../core/config/config_env.dart';

class MarvelCharactersDatasourceImpl implements SearchCharactersDatasource {
  Dio dio;
  Logger logger;

  MarvelCharactersDatasourceImpl({required this.dio, required this.logger});

  @override
  Future<List<ResultCharactersModel>> getCharacters(
      {int? comicId, int? offset, int? limit}) async {
    try {
      final queryParams = {
        'apikey': ConfigEnv.apiKey,
        'hash': ConfigEnv.hash,
        'ts': 1,
      };

      if (comicId != null) {
        queryParams['comics'] = comicId;
      }
      if (offset != null) {
        queryParams['offset'] = offset;
      }
      if (limit != null) {
        queryParams['limit'] = limit;
      }

      final response = await dio.get(
        ConfigEnv.charactersPath,
        queryParameters: queryParams,
      );

      if (response.statusCode == 200) {
        logger.d('O if da função getCharacters da external foi validado.');
        logger.d('Os query params são : $queryParams');
        List<ResultCharactersModel> characterList = [];

        List results = response.data['data']['results'];

        characterList =
            results.map((e) => ResultCharactersModel.fromMap(e)).toList();

        return characterList;
      } else {
        logger.e('Ocorreu um erro: $DataSourceFailure');
        throw DataSourceFailure();
      }
    } catch (e) {
      logger.e('Ocorreu um erro: $DataSourceFailure');
      throw DataSourceFailure();
    }
  }
}
