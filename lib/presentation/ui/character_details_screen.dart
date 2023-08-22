import 'package:flutter/material.dart';
import 'package:flutter_task_qur_health/domain/character_model.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Results character;

  const CharacterDetailsScreen({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(character.name)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(character.image),
            SizedBox(height: 16.0),
            Text('Status: ${character.status}'),
            Text('Species: ${character.species}'),
          ],
        ),
      ),
    );
  }
}
