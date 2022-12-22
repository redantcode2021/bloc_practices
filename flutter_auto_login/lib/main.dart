import 'package:flutter/material.dart';
import 'package:flutter_auto_login/app_bloc_observer.dart';
import 'package:flutter_auto_login/bloc/user_bloc.dart';
import 'package:flutter_auto_login/screens/about_page.dart';
import 'package:flutter_auto_login/screens/edit_profile_page.dart';
import 'package:flutter_auto_login/screens/login_page.dart';
import 'package:flutter_auto_login/screens/main_page.dart';
import 'package:flutter_auto_login/screens/profile_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/',
        name: 'main_page',
        builder: (context, state) {
          return const MainPage();
        },
        routes: [
          GoRoute(
            path: 'about',
            name: 'about',
            builder: (context, state) {
              return const AboutPage();
            },
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) {
              return const ProfilPage();
            },
            routes: [
              GoRoute(
                path: 'edit_profile',
                name: 'edit_profile',
                builder: (context, state) {
                  return const EditProfilePage();
                },
              )
            ],
          ),
        ],
      ),
    ],
    initialLocation: '/login',
    debugLogDiagnostics: true,
    routerNeglect: true,
  );

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc()..add(CheckSignInStatus()),
      child: BlocListener<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserSignedIn) {
            router.goNamed('main_page');
          } else if (state is UserSignedOut) {
            router.goNamed('login');
          }
        },
        child: MaterialApp.router(
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
