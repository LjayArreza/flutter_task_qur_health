import 'package:dio/dio.dart';
import 'package:flutter_task_qur_health/domain/character_model.dart';

class CharacterRepository {
  final Dio _dio;

  CharacterRepository(this._dio);

  Future<Characters> fetchCharacters() async {
    final response =
        await _dio.get('https://rickandmortyapi.com/api/character');
    return Characters.fromJson(response.data);
  }
}
