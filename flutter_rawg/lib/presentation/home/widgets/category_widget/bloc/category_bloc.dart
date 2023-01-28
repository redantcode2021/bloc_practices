import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter_rawg/data/repository/game_repository.dart';
import 'package:flutter_rawg/model/model_barrel.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final GameRepository gameRepository;
  CategoryBloc({
    required this.gameRepository,
  }) : super(const CategoryState()) {
    on<GetCategories>(_mapGetCategoriesEventToState);
    on<SelectCategory>(_mapSelectCategoryEventToState);
  }

  Future<FutureOr<void>> _mapGetCategoriesEventToState(
    GetCategories event,
    Emitter<CategoryState> emit,
  ) async {
    emit(state.copyWith(status: CategoryStatus.loading));
    try {
      final genres = await gameRepository.getGenres();
      emit(
        state.copyWith(
          status: CategoryStatus.success,
          categories: genres,
        ),
      );
    } catch (error, stackTrace) {
      print(stackTrace);
      emit(state.copyWith(status: CategoryStatus.error));
    }
  }

  FutureOr<void> _mapSelectCategoryEventToState(
    SelectCategory event,
    Emitter<CategoryState> emit,
  ) {
    emit(state.copyWith(
      status: CategoryStatus.selected,
      idSelected: event.idSelected,
    ));
  }
}
