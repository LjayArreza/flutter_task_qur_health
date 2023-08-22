import 'package:dio/dio.dart';
import 'package:flutter_task_qur_health/data/character_repository.dart';
import 'package:flutter_task_qur_health/domain/character_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CharacterRepository', () {
    late CharacterRepository characterRepository;
    late Dio dio;

    setUp(() {
      dio = Dio();
      characterRepository = CharacterRepository(dio);
    });

    test('fetchCharacters should return Characters', () async {
      final characters = await characterRepository.fetchCharacters();
      expect(characters, isA<Characters>());
    });
  });
}
