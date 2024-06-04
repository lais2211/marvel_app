import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/thumbnail_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/repositories/search_characters_repository.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/usecases/search_characters_usecase.dart';
import 'package:mocktail/mocktail.dart';

class SearchCharactersRepositoryMock extends Mock
    implements SearchCharactersRepository {}

void main() {
  final repository = SearchCharactersRepositoryMock();
  final usecase = SearchCharactersUsecaseImpl(repository: repository);

  test('should return a list of characters', () async {
    // Arrange
    final charactersEntity = [
      CharactersEntity(
        id: 1,
        name: 'Test Character',
        thumbnail: const ThumbnailEntity(
          imageUrl: 'https://example.com/image',
          extension: 'jpg',
        ),
        description: '',
      ),
    ];

    when(() => repository.search())
        .thenAnswer((_) async => Right(charactersEntity));

    // Act
    final result = await usecase();

    // Assert
    expect(result.isRight(), true);
    expect(result.getOrElse(() => []), isA<List<CharactersEntity>>());
  });

  test('should return a FailureSearch on error', () async {
    // Arrange
    when(() => repository.search())
        .thenAnswer((_) async => Left(InvalidResponseFailure()));

    // Act
    final result = await usecase();

    // Assert
    expect(result.isLeft(), true);
    expect(result.fold(id, (_) => null), isA<FailureSearch>());
  });
}
