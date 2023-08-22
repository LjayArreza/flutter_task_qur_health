import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_qur_health/presentation/bloc/character_bloc.dart';
import 'package:flutter_task_qur_health/presentation/ui/character_details_screen.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CharacterScreenState createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  String nameFilter = "";
  String speciesFilter = "";
  String statusFilter = "";

  @override
  Widget build(BuildContext context) {
    final characterBloc = context.read<CharacterBloc>();
    characterBloc.add(FetchCharacters(
      nameFilter: nameFilter,
      speciesFilter: speciesFilter,
      statusFilter: statusFilter,
    ));

    return Scaffold(
      appBar: AppBar(title: const Text('Character List')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: const InputDecoration(labelText: 'Name Filter'),
                    onChanged: (value) {
                      setState(() {
                        nameFilter = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: 'Species Filter'),
                    onChanged: (value) {
                      setState(() {
                        speciesFilter = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: 'Status Filter'),
                    onChanged: (value) {
                      setState(() {
                        statusFilter = value;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      nameFilter = "";
                      speciesFilter = "";
                      statusFilter = "";
                    });
                  },
                  child: const Text('Clear Filters'),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                if (state is CharacterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CharacterLoaded) {
                  return ListView.builder(
                    itemCount: state.characters.results.length,
                    itemBuilder: (context, index) {
                      final character = state.characters.results[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  CharacterDetailsScreen(character: character),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            title: Text(character.name),
                            subtitle: Row(
                              children: [
                                Text('Status: ${character.status}'),
                                const SizedBox(width: 5),
                                const Text('|'),
                                const SizedBox(width: 5),
                                Text('Species: ${character.species}')
                              ],
                            ),
                            leading: Image.network(character.image),
                          ),
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
          ),
        ],
      ),
    );
  }
}
