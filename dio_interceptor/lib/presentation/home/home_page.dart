import 'package:dio_interceptor/bloc/auth/auth_bloc.dart';
import 'package:dio_interceptor/bloc/email/email_bloc.dart';
import 'package:dio_interceptor/bloc/home/home_bloc.dart';
import 'package:dio_interceptor/bloc/profile/profile_bloc.dart';
import 'package:dio_interceptor/presentation/auth/login/login_page.dart';
import 'package:dio_interceptor/presentation/email/email_page.dart';
import 'package:dio_interceptor/presentation/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: "Profile",
        onPressed: () {
          context.read<ProfileBloc>().add(ProfileFetchEvent());
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const ProfilePage(),
            ),
          );
        },
        child: const Icon(Icons.person),
      ),
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Users"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthBloc>().add(LogOutRequested());
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                  (route) => false);
            },
            icon: const Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: BlocListener<HomeBloc, HomeState>(
        listener: ((context, state) {
          if (state is HomeLoggedOut) {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const LoginPage()),
                (route) => false);
          }
        }),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is HomeError) {
            return Center(
              child: Text(state.message),
            );
          }
          if (state is HomeLoaded) {
            return ListView.builder(
                itemCount: state.users.length,
                itemBuilder: (context, index) {
                  print('user length: ${state.users.length}');
                  return ListTile(
                    onTap: () {
                      context.read<EmailBloc>().add(
                            FetchEmailEvent(
                              id: state.users[index]!.id.toString(),
                            ),
                          );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const EmailPage(),
                        ),
                      );
                    },
                    title: Text(state.users[index]!.firstName.toString()),
                    subtitle: Text(state.users[index]!.email.toString()),
                  );
                });
          }
          return Container();
        }),
      ),
    );
  }
}
