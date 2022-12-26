part of 'joke_bloc.dart';

abstract class JokeState extends Equatable {
  const JokeState();

  @override
  List<Object> get props => [];
}

class JokeLoadingState extends JokeState {
  @override
  List<Object> get props => [];
}

class JokeLoadedState extends JokeState {
  final JokeModel joke;
  const JokeLoadedState({
    required this.joke,
  });

  @override
  List<Object> get props => [joke];
}

class JokeErrorState extends JokeState {
  final String error;
  const JokeErrorState({
    required this.error,
  });

  @override
  List<Object> get props => [error];
}
