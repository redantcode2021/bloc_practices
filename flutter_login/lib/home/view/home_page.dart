import 'package:flutter/material.dart';
import 'package:flutter_login/authentication/authentication.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Builder(
              builder: (context) {
                final userId = context
                    .select((AuthenticationBloc bloc) => bloc.state.user.id);
                return Text('UserID: $userId');
              },
            ),
            ElevatedButton(
              onPressed: () {
                context
                    .read<AuthenticationBloc>()
                    .add(AuthenticationLogoutRequested());
              },
              child: const Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
