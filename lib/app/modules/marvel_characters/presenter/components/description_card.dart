import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

import '../../domain/entities/characters_entity.dart';
import '../../l10n/marvel_characters_text.dart';

class DescriptionCard extends StatefulWidget {
  final CharactersEntity characterIndex;

  const DescriptionCard({
    super.key,
    required this.characterIndex,
  });

  @override
  State<DescriptionCard> createState() => _DescriptionCardState();
}

class _DescriptionCardState extends State<DescriptionCard> {
  MarvelCharactersText text = MarvelCharactersText();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: CachedNetworkImage(
                imageUrl: widget.characterIndex.thumbnail,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              top: 30.0,
              left: 10.0,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Text(
                widget.characterIndex.name.toUpperCase(),
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              widget.characterIndex.description.isEmpty
                  ? Text(
                      text.noDescription,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    )
                  : Text(
                      widget.characterIndex.description,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(color: Colors.white),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
