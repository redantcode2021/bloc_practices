part of 'games_by_category_bloc.dart';

abstract class GamesByCategoryEvent extends Equatable {
  const GamesByCategoryEvent();

  @override
  List<Object> get props => [];
}

class GetGamesByCategory extends GamesByCategoryEvent {
  final int idSelected;
  final String categoryName;
  const GetGamesByCategory({
    required this.idSelected,
    required this.categoryName,
  });

  @override
  List<Object> get props => [idSelected, categoryName];
}
