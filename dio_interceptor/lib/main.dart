import 'package:dio_interceptor/app_bloc_observer.dart';
import 'package:dio_interceptor/bloc/auth/auth_bloc.dart';
import 'package:dio_interceptor/bloc/email/email_bloc.dart';
import 'package:dio_interceptor/bloc/home/home_bloc.dart';
import 'package:dio_interceptor/bloc/profile/profile_bloc.dart';
import 'package:dio_interceptor/data/repository/auth_repository.dart';
import 'package:dio_interceptor/data/repository/email_repository.dart';
import 'package:dio_interceptor/data/repository/home_repository.dart';
import 'package:dio_interceptor/data/repository/profile_repository.dart';
import 'package:dio_interceptor/data/services/locator.dart';
import 'package:dio_interceptor/data/sharedprefs/shared_preference_helper.dart';
import 'package:dio_interceptor/presentation/home/home_page.dart';
import 'package:dio_interceptor/presentation/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final String? token;
  final locator = getIt.get<SharedPreferenceHelper>();

  @override
  void initState() {
    super.initState();
    token = locator.getUserToken();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(
          create: (context) => AuthRepository(),
        ),
        RepositoryProvider<HomeRepository>(
          create: (context) => HomeRepository(),
        ),
        RepositoryProvider<ProfileRepository>(
          create: (context) => ProfileRepository(),
        ),
        RepositoryProvider<EmailRepository>(
          create: (context) => EmailRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) => AuthBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            ),
          ),
          BlocProvider<HomeBloc>(
            create: (context) => HomeBloc(
              homeRepository: RepositoryProvider.of<HomeRepository>(context),
            ),
          ),
          BlocProvider<ProfileBloc>(
            create: (context) => ProfileBloc(
              profileRepository:
                  RepositoryProvider.of<ProfileRepository>(context),
            ),
          ),
          BlocProvider<EmailBloc>(
            create: (context) => EmailBloc(
              emailRepository: RepositoryProvider.of<EmailRepository>(context),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: token != null ? const HomePage() : const LoginPage(),
        ),
      ),
    );
  }
}
