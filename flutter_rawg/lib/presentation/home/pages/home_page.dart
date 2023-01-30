import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rawg/data/repository/game_repository.dart';
import 'package:flutter_rawg/presentation/home/pages/home_layout.dart';
import 'package:flutter_rawg/presentation/home/widgets/all_games_widget/all_games_barrel.dart';
import 'package:flutter_rawg/presentation/home/widgets/category_widget/bloc/category_bloc.dart';
import 'package:flutter_rawg/presentation/home/widgets/games_by_category_widget/bloc/games_by_category_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent,
      body: RepositoryProvider(
        create: (context) => GameRepository(),
        child: MultiBlocProvider(providers: [
          BlocProvider<CategoryBloc>(
            create: (context) =>
                CategoryBloc(gameRepository: context.read<GameRepository>())
                  ..add(
                    GetCategories(),
                  ),
          ),
          BlocProvider<GamesByCategoryBloc>(
            create: (context) => GamesByCategoryBloc(
                gameRepository: context.read<GameRepository>()),
          ),
          BlocProvider<AllGamesBloc>(
            create: (context) =>
                AllGamesBloc(gameRepository: context.read<GameRepository>())
                  ..add(
                    GetGames(),
                  ),
          ),
        ], child: const HomeLayout()),
      ),
    );
  }
}
