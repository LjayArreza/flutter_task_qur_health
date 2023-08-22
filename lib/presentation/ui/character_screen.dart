import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_qur_health/presentation/bloc/character_bloc.dart';

class CharacterScreen extends StatelessWidget {
  const CharacterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final characterBloc = context.read<CharacterBloc>();
    characterBloc.add(FetchCharacters());

    return Scaffold(
      appBar: AppBar(title: const Text('Character List')),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.characters.results.length,
              itemBuilder: (context, index) {
                final character = state.characters.results[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListTile(
                    title: Text(character.name),
                    subtitle: Row(
                      children: [
                        Text('Status: ${character.status}'),
                        const SizedBox(width: 5),
                        const Text('|'),
                        const SizedBox(width: 5),
                        Text('Spices: ${character.species}')
                      ],
                    ),
                    leading: Image.network(character.image),
                  ),
                );
              },
            );
          } else if (state is CharacterError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return const Center(child: Text('Unknown error'));
        },
      ),
    );
  }
}
