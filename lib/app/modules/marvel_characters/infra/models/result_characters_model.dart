import 'dart:convert';

import '../../domain/entities/characters_entity.dart';
import '../../domain/entities/thumbnail_entity.dart';

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
      thumbnail: ThumbnailEntity(
        imageUrl: map['thumbnail']['path'],
        extension: map['thumbnail']['extension'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': {
        'path': thumbnail.imageUrl,
        'extension': thumbnail.extension,
      },
    };
  }

  factory ResultCharactersModel.fromJson(String json) {
    Map<String, dynamic> data = jsonDecode(json);
    return ResultCharactersModel.fromMap(data);
  }

  String toJson() {
    return jsonEncode(toMap());
  }
}
