import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/models.dart';

part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosLoading()) {
    on<LoadTodos>(_onLoadTodos);
    on<AddTodo>(_onAddTodos);
  }

  void _onLoadTodos(
    LoadTodos event,
    Emitter<TodosState> emit,
  ) {
    emit(TodosLoaded(todos: event.todos));
  }

  void _onAddTodos(
    AddTodo event,
    Emitter<TodosState> emit,
  ) {
    final state = this.state;
    if (state is TodosLoaded) {
      emit(TodosLoaded(todos: List.from(state.todos)..add(event.todo)));
    }
  }
}
