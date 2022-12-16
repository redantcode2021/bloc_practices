import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todo/simple_bloc_observer.dart';

import 'blocs/blocs.dart';
import 'models/models.dart';
import 'screens/home_screen.dart';

void main() {
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TodosBloc()
            ..add(
              LoadTodos(
                todos: [
                  Todo(
                    id: '1',
                    task: 'Bloc Pattern Video',
                    description: 'Explain what is the Bloc Pattern',
                  ),
                  Todo(
                    id: '2',
                    task: 'Lorem Ipsum',
                    description: 'Chilling with Lorem ipsum',
                  ),
                ],
              ),
            ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Todo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF000A1F),
          appBarTheme: const AppBarTheme(
            color: Color(0xFF000A1F),
          ),
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
