part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

class GetCategories extends CategoryEvent {}

class SelectCategory extends CategoryEvent {
  final int idSelected;
  const SelectCategory({
    required this.idSelected,
  });

  @override
  List<Object> get props => [idSelected];
}
