part of 'character_bloc.dart';

abstract class CharacterState {}

class CharacterInitial extends CharacterState {}

class CharacterLoading extends CharacterState {}

class CharacterLoaded extends CharacterState {
  final Characters characters;

  CharacterLoaded(this.characters);
}

class CharacterError extends CharacterState {
  final String error;

  CharacterError(this.error);
}
