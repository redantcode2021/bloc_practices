import 'package:flutter/material.dart';
import 'package:flutter_auto_login/bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login Page', style: GoogleFonts.inter())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Login Page',
              style: GoogleFonts.poppins(
                  fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<UserBloc>().add(const SignIn(
                      email: 'john.wick@contoso.com', password: '123456'));
                },
                child: Text(
                  'LOGIN',
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
