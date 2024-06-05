import 'package:dartz/dartz.dart';

import 'package:marvel_app/app/core/errors/errors.dart';

import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/infra/datasource/search_characters_datasource.dart';

import '../../domain/repositories/search_characters_repository.dart';

class SearchCharactersRepositoryImpl implements SearchCharactersRepository {
  final SearchCharactersDatasource datasource;

  SearchCharactersRepositoryImpl({required this.datasource});

  @override
  Future<Either<FailureSearch, List<CharactersEntity>>> search(
      {int? comicId, int? offset}) async {
    try {
      final result =
          await datasource.getCharacters(comicId: comicId, offset: offset);
      return Right(result);
    } on Exception {
      return Left(DataSourceFailure());
    }
  }
}
