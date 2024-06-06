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

  void infiniteScrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      controller.loadCharacters(controller.offset);
      controller.offset += 20;
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => infiniteScrollListener());
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
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          controller: _scrollController,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppBarBackground(title: text.titleCharacters),
              AppBodyBackground(charactersList: controller.charactersList),
              CharactersList(
                charactersList: controller.charactersListScroll,
                isLoading: controller.isLoading,
              ),
            ],
          ),
        );
      }),
    );
  }
}
