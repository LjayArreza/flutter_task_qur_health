part of 'character_bloc.dart';

abstract class CharacterEvent {}

class FetchCharacters extends CharacterEvent {
  final String nameFilter;
  final String speciesFilter;
  final String statusFilter;

  FetchCharacters({
    this.nameFilter = "",
    this.speciesFilter = "",
    this.statusFilter = "",
  });
}
