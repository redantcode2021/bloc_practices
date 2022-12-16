import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/blocs/todos/todos_bloc.dart';
import 'package:flutter_todo/screens/add_todo_screen.dart';

import '../models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Pattern: To Dos'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AddTodoScreen(),
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: BlocBuilder<TodosBloc, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _todo(state.todos),
                ],
              ),
            );
          } else {
            return const Text("Something went wrong");
          }
        },
      ),
    );
  }

  Column _todo(List<Todo> todos) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: Row(
            children: const [
              Text(
                'Status To Dos:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return _todosCard(context, todos[index]);
          },
        ),
      ],
    );
  }

  Card _todosCard(
    BuildContext context,
    Todo todo,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                '#${todo.id}: ${todo.task}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_task),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.cancel),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
