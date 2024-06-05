import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:mobx/mobx.dart';

import '../../domain/usecases/search_characters_usecase.dart';
part 'home_page_controller.g.dart';

class HomePageController = _HomePageControllerBase with _$HomePageController;

abstract class _HomePageControllerBase with Store {
  final SearchCharactersUsecase usecase;

  _HomePageControllerBase(this.usecase);

  @observable
  ObservableList<CharactersEntity> charactersList =
      ObservableList<CharactersEntity>();

  @observable
  ObservableList<CharactersEntity> charactersListScroll =
      ObservableList<CharactersEntity>();

  @action
  Future<void> getCharactersByComicId(int comicId, int offset) async {
    var characters = await usecase(comicId: comicId, offset: offset);

    characters.fold(
      (left) {},
      (right) {
        charactersList.addAll(right);
        charactersList = ObservableList.of(charactersList);
      },
    );
  }

  @action
  Future<void> getCharacters(int offset) async {
    var characters = await usecase(offset: offset);

    characters.fold(
      (left) {},
      (right) {
        charactersListScroll.addAll(right);
        return ObservableList.of(charactersListScroll);
      },
    );
  }
}
