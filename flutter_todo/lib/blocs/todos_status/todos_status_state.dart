part of 'todos_status_bloc.dart';

abstract class TodosStatusState extends Equatable {
  const TodosStatusState();

  @override
  List<Object> get props => [];
}

class TodosStatusLoading extends TodosStatusState {}

class TodosStatusLoaded extends TodosStatusState {
  final List<Todo> pendingTodos;
  final List<Todo> completedTodos;
  final List<Todo> cancelledTodos;
  const TodosStatusLoaded({
    required this.pendingTodos,
    required this.completedTodos,
    required this.cancelledTodos,
  });

  @override
  List<Object> get props => [
        pendingTodos,
        completedTodos,
        cancelledTodos,
      ];
}
