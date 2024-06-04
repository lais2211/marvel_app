import 'package:dartz/dartz.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/repositories/search_characters_repository.dart';

abstract class SearchCharactersUsecase {
  Future<Either<FailureSearch, List<CharactersEntity>>> call();
}

class SearchCharactersUsecaseImpl implements SearchCharactersUsecase {
  final SearchCharactersRepository repository;

  SearchCharactersUsecaseImpl({required this.repository});

  @override
  Future<Either<FailureSearch, List<CharactersEntity>>> call() async {
    try {
      return await repository.search();
    } on Exception {
      return Left(InvalidResponseFailure());
    }
  }
}
