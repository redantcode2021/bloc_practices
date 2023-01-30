import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_rawg/data/repository/game_repository.dart';
import 'package:flutter_rawg/model/model_barrel.dart';

part 'all_games_event.dart';
part 'all_games_state.dart';

class AllGamesBloc extends Bloc<AllGamesEvent, AllGamesState> {
  final GameRepository gameRepository;
  AllGamesBloc({
    required this.gameRepository,
  }) : super(const AllGamesState()) {
    on<GetGames>(_mapGetGamesEventToState);
  }

  Future<FutureOr<void>> _mapGetGamesEventToState(
    GetGames event,
    Emitter<AllGamesState> emit,
  ) async {
    try {
      emit(state.copyWith(status: AllGamesStatus.loading));
      final games = await gameRepository.getGames();
      emit(
        state.copyWith(
          status: AllGamesStatus.success,
          games: games,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: AllGamesStatus.error));
    }
  }
}
