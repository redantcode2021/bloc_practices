import 'package:bloc_jokes_api/data/repository/joke_repository.dart';
import 'package:bloc_jokes_api/presentation/home/home.dart';
import 'package:bloc_jokes_api/simple_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'This a Joke',
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.grey[900],
        backgroundColor: Colors.grey[900],
        scaffoldBackgroundColor: Colors.grey[900],
        buttonTheme: ButtonThemeData(
            buttonColor: Colors.grey[900], textTheme: ButtonTextTheme.primary),
      ),
      home: RepositoryProvider(
        create: (context) => JokeRepository(),
        child: const Home(),
      ),
    );
  }
}
