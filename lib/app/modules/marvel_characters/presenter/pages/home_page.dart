import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/app_bar_background.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/characters_list.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/controllers/home_page_controller.dart';

import '../../l10n/marvel_characters_text.dart';
import '../components/app_body_background.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController controller = Modular.get();
  MarvelCharactersText text = MarvelCharactersText();
  final ScrollController _scrollController = ScrollController();
  int offset = 20;
  bool loading = true;

  void infiniteScrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      loadCharacters(offset);
      offset += 20;
    }
  }

  void loadCharacters(int offset) async {
    loading = true;
    await controller.getCharacters(offset);
    loading = false;
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => infiniteScrollListener());
    controller.getCharactersByComicId(10583, 5);
    controller.getCharacters(0);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (context) {
        return Column(
          children: [
            AppBarBackground(title: text.titleCharacters),
            AppBodyBackground(charactersList: controller.charactersList),
            CharactersList(
              charactersList: controller.charactersListScroll,
              scrollController: _scrollController,
            ),
          ],
        );
      }),
    );
  }
}
