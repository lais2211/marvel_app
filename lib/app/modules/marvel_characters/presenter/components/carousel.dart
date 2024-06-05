import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/marvel_characters/domain/entities/characters_entity.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/character_card.dart';

class Carousel extends StatelessWidget {
  const Carousel({
    Key? key,
    required this.charactersList,
  }) : super(key: key);

  final List<CharactersEntity> charactersList;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.sizeOf(context).width;
    final screenHeight = MediaQuery.sizeOf(context).height;

    bool isLargeScreen = screenWidth >= 800;
    double carouselHeight = screenHeight / 2 - 160;
    double carouselWidth = screenWidth / 2 - 60;

    return Center(
      child: SizedBox(
        width: isLargeScreen ? screenWidth * 0.8 : screenWidth,
        child: charactersList.isEmpty
            ? const CircularProgressIndicator()
            : CarouselSlider.builder(
                itemCount: 5,
                itemBuilder: (context, itemIndex, pageViewIndex) {
                  final actualCharacter = charactersList[itemIndex];

                  return GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                          height: carouselHeight,
                          width: carouselWidth,
                          child: CharacterCard(
                            imageUrl: actualCharacter.thumbnail,
                            name: actualCharacter.name,
                          )),
                    ),
                  );
                },
                options: CarouselOptions(
                  height: carouselHeight,
                  autoPlay: true,
                  viewportFraction: isLargeScreen ? 0.4 : 0.5,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  pageSnapping: true,
                  enlargeCenterPage: true,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
              ),
      ),
    );
  }
}
