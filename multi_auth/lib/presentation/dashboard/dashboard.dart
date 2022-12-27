import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_auth/bloc/auth_bloc.dart';
import 'package:multi_auth/presentation/signin/signin.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get current user from FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to SignIn screen
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignIn()),
                (route) => false);
          }
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Email: \n ${user.email}',
                style: const TextStyle(fontSize: 24),
                textAlign: TextAlign.center,
              ),
              user.photoURL != null
                  ? Image.network("${user.photoURL}")
                  : Container(),
              user.displayName != null
                  ? Text("${user.displayName}")
                  : Container(),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Signin Out the user
                  context.read<AuthBloc>().add(SignOutRequested());
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
