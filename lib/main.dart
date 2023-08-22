import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

import 'data/character_repository.dart';
import 'presentation/bloc/character_bloc.dart';
import 'presentation/ui/character_screen.dart';

void main() {
  final Dio dio = Dio();
  final CharacterRepository repository = CharacterRepository(dio);
  final CharacterBloc characterBloc = CharacterBloc(repository);

  runApp(MyApp(characterBloc));
}

class MyApp extends StatelessWidget {
  final CharacterBloc characterBloc;

  const MyApp(this.characterBloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rick and Morty Characters',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => characterBloc,
        child: const CharacterScreen(),
      ),
    );
  }
}
