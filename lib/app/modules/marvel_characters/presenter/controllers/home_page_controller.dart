import 'package:flutter_modular/flutter_modular.dart';
import 'package:logger/logger.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/config/widget_status.dart';
import '../../domain/usecases/search_characters_usecase.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final SearchCharactersUsecase usecase;
  Logger logger = Modular.get();

  _HomePageControllerBase(this.usecase);

  @observable
  WidgetStatus isLoading = WidgetStatus.ready;

  @observable
  ObservableList<CharactersEntity> charactersList =
      ObservableList<CharactersEntity>();

  @observable
  ObservableList<CharactersEntity> charactersListScroll =
      ObservableList<CharactersEntity>();

  @observable
  WidgetStatus? appStatus;

  int offset = 20;

  @action
  Future<void> getCharactersByComicId(
      int comicId, int offset, int limit) async {
    var characters =
        await usecase(comicId: comicId, offset: offset, limit: limit);
    logger.d('Entrou na função getCharactersByComicId');

    characters.fold(
      (left) {
        logger.d('Entrou no left (Failure).');
        appStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess).');
        charactersList.addAll(right);
        return charactersList = ObservableList.of(charactersList);
      },
    );
  }

  @action
  Future<void> getCharacters(int offset) async {
    var characters = await usecase(offset: offset);
    logger.d('Entrou na função getCharacters');
    logger.d('O valor da variavel offset é de:  $offset');

    characters.fold(
      (left) {
        logger.d('Entrou no left (Failure).');
        appStatus = WidgetStatus.error;
      },
      (right) {
        logger.d('Entrou no right (Sucess).');
        charactersListScroll.addAll(right);
        return ObservableList.of(charactersListScroll);
      },
    );
  }

  @action
  Future<void> loadCharacters(int offset) async {
    logger.d('Entrou na função loadCharacters');
    isLoading = WidgetStatus.loading;
    await getCharacters(offset);
    isLoading = WidgetStatus.ready;
  }
}
