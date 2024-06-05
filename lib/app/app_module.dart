import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/marvel_characters/domain/repositories/search_characters_repository.dart';
import 'modules/marvel_characters/domain/usecases/search_characters_usecase.dart';
import 'modules/marvel_characters/external/datasources/marvel_characters_datasource_impl.dart';
import 'modules/marvel_characters/infra/datasource/search_characters_datasource.dart';
import 'modules/marvel_characters/infra/repositories/search_characters_repository_impl.dart';
import 'modules/marvel_characters/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(Dio.new);
    i.add<SearchCharactersDatasource>(MarvelCharactersDatasourceImpl.new);
    i.add<SearchCharactersRepository>(SearchCharactersRepositoryImpl.new);
    i.add<SearchCharactersUsecase>(SearchCharactersUsecaseImpl.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
  }
}
