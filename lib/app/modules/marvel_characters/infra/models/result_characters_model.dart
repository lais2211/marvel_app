import '../../domain/entities/characters_entity.dart';

class ResultCharactersModel extends CharactersEntity {
  ResultCharactersModel({
    required super.id,
    required super.name,
    required super.description,
    required super.thumbnail,
  });

  factory ResultCharactersModel.fromMap(Map<String, dynamic> map) {
    return ResultCharactersModel(
        id: map['id'],
        name: map['name'],
        description: map['description'],
        thumbnail:
            '${map['thumbnail']?['path']}.${map['thumbnail']?['extension']} ');
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail
    };
  }
}
