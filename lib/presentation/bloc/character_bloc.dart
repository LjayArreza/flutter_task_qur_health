import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task_qur_health/data/character_repository.dart';
import 'package:flutter_task_qur_health/domain/character_model.dart';
part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterRepository repository;

  CharacterBloc(this.repository) : super(CharacterInitial()) {
    on<FetchCharacters>(_fetchCharacters);
  }

  void _fetchCharacters(
      FetchCharacters event, Emitter<CharacterState> emit) async {
    emit(CharacterLoading());
    try {
      final characters = await repository.fetchCharacters();
      emit(CharacterLoaded(characters));
    } catch (e) {
      emit(CharacterError(e.toString()));
    }
  }

  Stream<CharacterState> mapEventToState(CharacterEvent event) async* {
    if (event is FetchCharacters) {
      yield CharacterLoading();
      try {
        final characters = await repository.fetchCharacters();
        yield CharacterLoaded(characters);
      } catch (e) {
        yield CharacterError(e.toString());
      }
    }
  }
}
