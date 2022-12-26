import 'dart:async';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_jokes_api/data/model/joke_model.dart';
import 'package:bloc_jokes_api/data/repository/joke_repository.dart';
import 'package:equatable/equatable.dart';

part 'joke_event.dart';
part 'joke_state.dart';

class JokeBloc extends Bloc<JokeEvent, JokeState> {
  final JokeRepository _jokeRepository;
  JokeBloc(this._jokeRepository) : super(JokeLoadingState()) {
    on<LoadJokeEvent>(_onLoadJokeEvent);
  }

  Future<FutureOr<void>> _onLoadJokeEvent(
    LoadJokeEvent event,
    Emitter<JokeState> emit,
  ) async {
    emit(JokeLoadingState());
    try {
      final joke = await _jokeRepository.getJokes();
      emit(JokeLoadedState(joke: joke));
    } catch (e) {
      emit(JokeErrorState(error: e.toString()));
    }
  }
}
