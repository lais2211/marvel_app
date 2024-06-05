import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/character_card.dart';
import '../../domain/entities/characters_entity.dart';

class CharactersList extends StatefulWidget {
  final List<CharactersEntity> charactersList;
  final ScrollController scrollController;
  const CharactersList(
      {super.key,
      required this.charactersList,
      required this.scrollController});

  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'lib/assets/images/background1.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            child: Observer(builder: (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: GridView.builder(
                  controller: widget.scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      childAspectRatio: 2 / 3),
                  itemCount: widget.charactersList.length,
                  itemBuilder: (context, index) {
                    final actualCharacter = widget.charactersList[index];
                    return CharacterCard(
                      imageUrl: actualCharacter.thumbnail,
                      name: actualCharacter.name,
                    );
                  },
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
