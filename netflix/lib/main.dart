import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_router/go_router.dart';
import 'package:netflix/bloc/configuration/configuration_bloc.dart';
import 'package:netflix/cubit/animation_status_cubit.dart';
import 'package:netflix/data/repository/movie_repository.dart';
import 'package:netflix/data/services/locator.dart';
import 'package:netflix/model/configuration.dart';
import 'package:netflix/presentation/home/widgets/trending_tvshow_widget/bloc/trending_tv_show_bloc.dart';
import 'package:netflix/presentation/profile/bloc/profile_bloc.dart';
import 'package:netflix/presentation/profile/pages/profile_selection_screen.dart';
import 'package:netflix/utils/app_bloc_observer.dart';
import 'package:netflix/utils/utils.dart';

import 'presentation/home/pages/home_screen.dart';
import 'presentation/home/widgets/nextflix_scaffold.dart';

Future<void> main() async {
  await dotenv.load(fileName: "assets/.env");
  await setup();
  Bloc.observer = AppBlocObserver();
  runApp(NextflipApp());
}

class NextflipApp extends StatelessWidget {
  NextflipApp({super.key});

  final MovieRepository _movieRepository = MovieRepository();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _movieRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(),
          ),
          BlocProvider<AnimationStatusCubit>(
            create: (context) => AnimationStatusCubit(),
          ),
          BlocProvider<ConfigurationBloc>(
            create: (context) =>
                ConfigurationBloc(movieRepository: _movieRepository)
                  ..add(FetchConfiguration()),
            lazy: false,
          ),
          BlocProvider<TrendingTvShowBloc>(
            create: (context) =>
                TrendingTvShowBloc(movieRepository: _movieRepository),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationProvider: _router.routeInformationProvider,
          routeInformationParser: _router.routeInformationParser,
          routerDelegate: _router.routerDelegate,
          title: 'Nextflic Bloc - GoRouter',
          theme: ThemeData(
              brightness: Brightness.dark,
              scaffoldBackgroundColor: backgroundColor,
              appBarTheme: const AppBarTheme(backgroundColor: backgroundColor)),
        ),
      ),
    );
  }

  final HeroController _heroController = HeroController();

  late final GoRouter _router = GoRouter(
    initialLocation: '/profile',
    routes: [
      GoRoute(
        path: '/profile',
        builder: (BuildContext context, GoRouterState state) {
          return const ProfileSelectionScreen();
        },
      ),
      ShellRoute(
        builder: (context, state, child) {
          return NetflixScaffold(child: child);
        },
        routes: <RouteBase>[
          GoRoute(
            name: 'Home',
            path: '/home',
            builder: (BuildContext context, GoRouterState state) {
              return const HomeScreen();
            },
          ),
        ],
      ),
    ],
  );
}
