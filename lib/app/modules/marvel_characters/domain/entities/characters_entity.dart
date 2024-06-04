import 'package:marvel_app/app/modules/marvel_characters/domain/entities/thumbnail_entity.dart';

class CharactersEntity {
  final int id;
  final String name;
  final String description;
  final ThumbnailEntity thumbnail;

  CharactersEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnail,
  });
}
