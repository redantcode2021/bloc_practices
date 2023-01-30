part of 'all_games_bloc.dart';

abstract class AllGamesEvent extends Equatable {
  const AllGamesEvent();

  @override
  List<Object> get props => [];
}

class GetGames extends AllGamesEvent {
  @override
  List<Object> get props => [];
}
