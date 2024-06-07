import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/character_card.dart';
import '../../domain/entities/characters_entity.dart';

class CharactersList extends StatefulWidget {
  final List<CharactersEntity> charactersList;
  final bool isLoading;

  const CharactersList(
      {super.key, required this.charactersList, required this.isLoading});

  @override
  _CharactersListState createState() => _CharactersListState();
}

class _CharactersListState extends State<CharactersList> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background3.jpg'),
            repeat: ImageRepeat.repeat,
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 40,
                mainAxisSpacing: 20,
                mainAxisExtent: 180,
              ),
              itemCount: widget.charactersList.length,
              itemBuilder: (context, index) {
                final actualCharacter = widget.charactersList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/description',
                        arguments: actualCharacter);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: CharacterCard(
                      imageUrl: actualCharacter.thumbnail,
                      name: actualCharacter.name,
                      imageFlex: 5,
                      textFlex: 3,
                    ),
                  ),
                );
              },
            ),
            if (widget.isLoading) ...[const CircularProgressIndicator()]
          ],
        ),
      );
    });
  }
}
