import 'package:flutter_modular/flutter_modular.dart';
import 'package:marvel_app/app/core/config/register_dio.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/controllers/home_page_controller.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/pages/splash_page.dart';

import 'modules/marvel_characters/domain/repositories/search_characters_repository.dart';
import 'modules/marvel_characters/domain/usecases/search_characters_usecase.dart';
import 'modules/marvel_characters/external/datasources/marvel_characters_datasource_impl.dart';
import 'modules/marvel_characters/infra/datasource/search_characters_datasource.dart';
import 'modules/marvel_characters/infra/repositories/search_characters_repository_impl.dart';
import 'modules/marvel_characters/presenter/pages/home_page.dart';

class AppModule extends Module {
  @override
  void binds(i) {
    i.add(() => registerDio());
    i.add<SearchCharactersDatasource>(MarvelCharactersDatasourceImpl.new);
    i.add<SearchCharactersRepository>(SearchCharactersRepositoryImpl.new);
    i.add<SearchCharactersUsecase>(SearchCharactersUsecaseImpl.new);
    i.addSingleton<HomePageController>(HomePageController.new);
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const SplashPage());
    r.child('/home', child: (context) => const HomePage());
  }
}
