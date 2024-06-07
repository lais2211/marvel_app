import 'package:flutter/material.dart';
import 'package:marvel_app/app/modules/marvel_characters/presenter/components/description_card.dart';

import '../../domain/entities/characters_entity.dart';

class DescriptionPage extends StatefulWidget {
  final CharactersEntity characterIndex;
  const DescriptionPage({
    super.key,
    required this.characterIndex,
  });

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

class _DescriptionPageState extends State<DescriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: DescriptionCard(
        characterIndex: widget.characterIndex,
      ),
    );
  }
}
