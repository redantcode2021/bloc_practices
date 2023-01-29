// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_rawg/data/repository/game_repository.dart';
import 'package:flutter_rawg/model/model_barrel.dart';

part 'games_by_category_event.dart';
part 'games_by_category_state.dart';

class GamesByCategoryBloc
    extends Bloc<GamesByCategoryEvent, GamesByCategoryState> {
  final GameRepository gameRepository;
  GamesByCategoryBloc({required this.gameRepository})
      : super(const GamesByCategoryState()) {
    on<GetGamesByCategory>(_mapGetGamesByCategoryToState);
  }

  Future<FutureOr<void>> _mapGetGamesByCategoryToState(
    GetGamesByCategory event,
    Emitter<GamesByCategoryState> emit,
  ) async {
    try {
      emit(state.copyWith(status: GamesByCategoryStatus.loading));

      final gamesByCategory =
          await gameRepository.getGamesbyCategory(event.idSelected);

      emit(
        state.copyWith(
          status: GamesByCategoryStatus.success,
          games: gamesByCategory,
          categoryName: event.categoryName,
        ),
      );
    } catch (error, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(status: GamesByCategoryStatus.error));
    }
  }
}
