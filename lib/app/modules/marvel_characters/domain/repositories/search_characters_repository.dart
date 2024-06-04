import 'package:dartz/dartz.dart';
import 'package:marvel_app/app/core/errors/errors.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';


abstract class SearchCharactersRepository {
  Future<Either<FailureSearch, List<CharactersEntity>>> search();
}