import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';

import 'carousel.dart';

class AppBodyBackground extends StatelessWidget {
  final List<CharactersEntity> charactersList;
  const AppBodyBackground({
    super.key,
    required this.charactersList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height / 2 - 150,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/background2.png',
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                const SizedBox(height: 5),
                Carousel(
                  charactersList: charactersList,
                ),
                const SizedBox(height: 5),
              ],
            ),
          ],
        ));
  }
}
