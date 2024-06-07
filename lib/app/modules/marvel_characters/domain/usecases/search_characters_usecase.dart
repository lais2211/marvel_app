import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/repositories/search_characters_repository.dart';

abstract class SearchCharactersUsecase {
  Future<Either<FailureSearch, List<CharactersEntity>>> call(
      {int? comicId, int? offset, int? limit});
}

class SearchCharactersUsecaseImpl implements SearchCharactersUsecase {
  final SearchCharactersRepository repository;
  Logger logger;

  SearchCharactersUsecaseImpl({required this.repository, required this.logger});

  @override
  Future<Either<FailureSearch, List<CharactersEntity>>> call(
      {int? comicId, int? offset, int? limit}) async {
    logger.d('Inicio do usecase na domain.');
    try {
      return await repository.search(
          comicId: comicId, offset: offset, limit: limit);
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
