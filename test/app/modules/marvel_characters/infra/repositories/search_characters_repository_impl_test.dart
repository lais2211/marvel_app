import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/thumbnail_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/datasource/search_characters_datasource.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/models/result_characters_model.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/repositories/search_characters_repository_impl.dart';
import 'package:mocktail/mocktail.dart';

class SearchCharactersDataSourceMock extends Mock
    implements SearchCharactersDatasource {}

void main() {
  final datasource = SearchCharactersDataSourceMock();
  final repository = SearchCharactersRepositoryImpl(datasource: datasource);

  test('should return a list of characters', () async {
    // Arrange
    final charactersModel = [
      ResultCharactersModel(
        id: 1,
        name: 'Test Character',
        thumbnail: const ThumbnailEntity(
          imageUrl: 'https://example.com/image',
          extension: 'jpg',
        ),
        description: '',
      ),
    ];

    when(() => datasource.getCharacters())
        .thenAnswer((_) async => charactersModel);

    // Act
    final result = await repository.search();

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<CharactersEntity>>());
  });

  test(
      'should return a DataSourceFailure when getCharacters throws an Exception',
      () async {
    // Arrange
    when(() => datasource.getCharacters()).thenThrow(Exception());

    // Act
    final result = await repository.search();

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<DataSourceFailure>());
  });
}
