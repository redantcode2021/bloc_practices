import 'package:flutter/material.dart';
import 'package:flutter_auto_login/models/user.dart';
import 'package:flutter_auto_login/screens/about_page.dart';
import 'package:flutter_auto_login/screens/edit_profile_page.dart';
import 'package:flutter_auto_login/screens/login_page.dart';
import 'package:flutter_auto_login/screens/main_page.dart';
import 'package:flutter_auto_login/screens/profile_page.dart';
import 'package:go_router/go_router.dart';

void main() {
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
            path: 'profile/:name',
            name: 'profile',
            builder: (context, state) {
              String name = state.params['name'] ?? 'no name';

              return ProfilPage(name: name);
            },
            routes: [
              GoRoute(
                path: 'edit_profile',
                name: 'edit_profile',
                builder: (context, state) {
                  Object? object = state.extra;

                  if (object != null && object is User) {
                    return EditProfilePage(user: object);
                  } else {
                    return EditProfilePage(
                      user: User(name: 'no name', email: 'no email'),
                    );
                  }
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
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
