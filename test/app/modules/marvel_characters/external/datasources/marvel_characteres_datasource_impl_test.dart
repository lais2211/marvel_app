import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/core/config/config_env.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/core/mocks/mock_config_env.dart';
import 'package:marvel_app/app/modules/marvel_characters/external/datasources/marvel_characters_datasource_impl.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/models/result_characters_model.dart';
import 'package:mocktail/mocktail.dart';

class DioMock extends Mock implements Dio {}

void main() {
  final dio = DioMock();
  final datasource = MarvelCharactersDatasourceImpl(dio: dio);

  test('should return a list of characters', () async {
    // Arrange
    when(() => dio.get(
          '${ConfigEnv.basePath}${ConfigEnv.charactersPath}',
          queryParameters: {
            'apikey': ConfigEnv.apiKey,
            'hash': ConfigEnv.hash,
            'ts': 1,
          },
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: MockConfigEnv.marvelCharactersResult,
          requestOptions: RequestOptions(),
          statusCode: 200,
        ));

    // Act
    final result = await datasource.getCharacters();

    // Assert
    expect(result, isA<List<ResultCharactersModel>>());
    expect(result.isNotEmpty, true);
  });

  test('should return an error when fetching characters', () async {
    // Arrange
    when(() => dio.get(
          '${ConfigEnv.basePath}${ConfigEnv.charactersPath}',
          queryParameters: {
            'apikey': ConfigEnv.apiKey,
            'hash': ConfigEnv.hash,
            'ts': 1,
          },
        )).thenAnswer((_) async => Response<Map<String, dynamic>>(
          data: null,
          requestOptions: RequestOptions(),
          statusCode: 400,
        ));

    // Act
    final future = datasource.getCharacters();

    // Assert
    expect(future, throwsA(isA<DataSourceFailure>()));
  });
}
